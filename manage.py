#!/usr/bin/env python3
import platform
import shutil
import subprocess
from pathlib import Path

REPO_DIR = Path(__file__).parent.resolve()
HOME = Path.home()


def read_packages(*files: Path) -> list[str]:
    packages = []

    for file in files:
        if not file.exists():
            print(f"[info] skipping missing package file: {file}")
            continue

        print(f"[info] reading packages from: {file}")

        packages.extend(
            line.strip()
            for line in file.read_text().splitlines()
            if line.strip() and not line.startswith("#")
        )

    return packages


def get_package_manager() -> tuple[str, Path]:
    package_dir = REPO_DIR / "packages"

    system = platform.system().lower()
    print(f"[info] detected platform: {system}")

    if system == "darwin":
        print("[info] using Homebrew")
        return "brew", package_dir / "mac.txt"

    if shutil.which("apt"):
        print("[info] using apt")
        return "apt", package_dir / "ubuntu.txt"

    if shutil.which("dnf"):
        print("[info] using dnf")
        return "dnf", package_dir / "fedora.txt"

    raise RuntimeError("Unsupported platform or package manager")


def install_packages():
    manager, env_file = get_package_manager()

    packages = read_packages(
        REPO_DIR / "packages" / "common.txt",
        env_file,
    )

    if not packages:
        print("[info] no packages to install")
        return

    print(f"[info] installing {len(packages)} packages with {manager}:")
    for package in packages:
        print(f"  - {package}")

    if manager == "apt":
        print("[info] running 'sudo apt update'")
        subprocess.run(["sudo", "apt", "update"], check=True)

    commands = {
        "brew": ["brew", "install", *packages],
        "apt": ["sudo", "apt", "install", "-y", *packages],
        "dnf": ["sudo", "dnf", "install", "-y", *packages],
    }

    command = commands[manager]
    print(f"[info] running: {' '.join(command)}")
    subprocess.run(command, check=True)


def stow_configs():
    stow_dir = REPO_DIR / "stow"

    if not stow_dir.exists():
        print(f"[info] missing stow directory: {stow_dir}")
        return

    print(f"[info] stowing configs from: {stow_dir}")

    for item in sorted(stow_dir.iterdir()):
        if item.is_dir():
            print(f"[info] stowing: {item.name}")
            subprocess.run(
                ["stow", "-t", str(HOME), item.name],
                cwd=stow_dir,
                check=True,
            )


def main():
    print(f"[info] repo directory: {REPO_DIR}")
    print(f"[info] HOME dir: {HOME}")

    install_packages()
    stow_configs()

    print("[info] setup complete")


if __name__ == "__main__":
    main()
