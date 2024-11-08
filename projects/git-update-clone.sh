#!/bin/bash

# List of repositories to sync
REPOS=(
     "https://gitlab.xfce.org/xfce/exo.git"
     "https://gitlab.xfce.org/xfce/garcon.git"
     "https://gitlab.xfce.org/xfce/libxfce4ui.git"
     "https://gitlab.xfce.org/xfce/libxfce4util.git"
     "https://gitlab.xfce.org/xfce/libxfce4windowing.git"
     "https://gitlab.xfce.org/apps/ristretto.git"
     "https://gitlab.xfce.org/xfce/thunar.git"
     "https://gitlab.xfce.org/thunar-plugins/thunar-archive-plugin.git"
     "https://gitlab.xfce.org/xfce/thunar-volman.git"
     "https://gitlab.xfce.org/xfce/tumbler.git"
     "https://gitlab.xfce.org/xfce/xfce4-appfinder.git"
     "https://gitlab.xfce.org/panel-plugins/xfce4-clipman-plugin.git"
     "https://gitlab.xfce.org/xfce/xfce4-dev-tools.git"
     "https://gitlab.xfce.org/apps/xfce4-notifyd.git"
     "https://gitlab.xfce.org/xfce/xfce4-panel.git"
     "https://gitlab.xfce.org/apps/xfce4-panel-profiles.git"
     "https://gitlab.xfce.org/xfce/xfce4-power-manager.git"
     "https://gitlab.xfce.org/apps/xfce4-screenshooter.git"
     "https://gitlab.xfce.org/xfce/xfce4-session.git"
     "https://gitlab.xfce.org/xfce/xfce4-settings.git"
     "https://gitlab.xfce.org/apps/xfce4-taskmanager.git"
     "https://gitlab.xfce.org/apps/xfce4-terminal.git"
     "https://gitlab.xfce.org/xfce/xfconf.git"
     "https://gitlab.xfce.org/xfce/xfdesktop.git"
     "https://gitlab.xfce.org/xfce/xfwm4.git"
)

START=$(date +%s)

# Directory where repositories will be cloned/pulled
TARGET_DIR="/home/kaos/projects/test1"

# Emoji for status
CLONE="⬇️"
CLONE_SUCCESS="⬇️✅"
CLONE_FAILURE="⬇️❌"
PULL="🔄"
PULL_SUCCESS="🔄✅"
PULL_FAILURE="🔄❌"

# Ensure target directory exists
mkdir -p "$TARGET_DIR"

# Function to clone or pull a repository
sync_repo() {
  local repo_url=$1
  local repo_name=$(basename "$repo_url" .git)
  local repo_dir="$TARGET_DIR/$repo_name"

  # Check if the directory already exists
  if [ -d "$repo_dir" ]; then
    echo "$PULL Pull latest changes for  '$repo_name'"
    cd "$repo_dir" || { echo "$PULL_FAILURE Failed to enter directory '$repo_dir'"; return; }
    if git pull; then
      echo "$PULL_SUCCESS Successfully pulled latest changes for '$repo_name'"
    else
      echo "$PULL_FAILURE Failed to pull latest changes for '$repo_name'"
    fi
  else
    echo "$CLONE  Cloning '$repo_name' Repository"
    if git clone "$repo_url" "$repo_dir"; then
      echo "$CLONE_SUCCESS Successfully cloned '$repo_name'"
    else
      echo "$CLONE_FAILURE Failed to clone '$repo_name'"
    fi
  fi
}

# Sync each repository
for repo in "${REPOS[@]}"; do
  sync_repo "$repo"
done

# End of script, calculate time taken to process repos.
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took ${DIFF} seconds to clone or check repositories"

