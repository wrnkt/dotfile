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
        if file.exists():
            packages.extend(
                line.strip()
                for line in file.read_text().splitlines()
                if line.strip() and not line.startswith("#")
            )

    return packages


def get_package_manager() -> tuple[str, Path]:
    package_dir = REPO_DIR / "packages"

    if platform.system().lower() == "darwin":
        return "brew", package_dir / "mac.txt"

    if shutil.which("apt"):
        return "apt", package_dir / "ubuntu.txt"

    if shutil.which("dnf"):
        return "dnf", package_dir / "fedora.txt"

    raise RuntimeError("Unsupported platform or package manager")


def install_packages():
    manager, env_file = get_package_manager()
    packages = read_packages(REPO_DIR / "packages" / "common.txt", env_file)

    if not packages:
        return

    install_with = {
        "brew": ["brew", "install", *packages],
        "apt": ["sudo", "apt", "install", "-y", *packages],
        "dnf": ["sudo", "dnf", "install", "-y", *packages],
    }

    if manager == "apt":
        subprocess.run(["sudo", "apt", "update"], check=True)

    subprocess.run(install_with[manager], check=True)


def stow_configs():
    stow_dir = REPO_DIR / "stow"

    for item in stow_dir.iterdir():
        if item.is_dir():
            subprocess.run(
                ["stow", "-t", str(HOME), item.name],
                cwd=stow_dir,
                check=True,
            )


def main():
    install_packages()
    stow_configs()


if __name__ == "__main__":
    main()
