#!/bin/bash

set -e

## add changrd to updaterepo function.
## bump version number 02.

# dir were xfce repos are:
baseDir=${baseDir:-/home/kaos/projects/xfce-mstr}
# dir were xfce packages are built:
bldBase=${bldBase:-/home/kaos/projects/xfce4-slkbld}
# dir for log files:
LOGD=${LOGD:-/home/kaos/projects/logs}

# backup then delete old logs.
#cd $LOGD || exit
#tar -cjf backup-logs.tar.bz2 *.log
#rm -f *.log
#cd ..

START=${START:-$(date +%s)}

# Find the master dirs and store.
allRepos=$(find  \
  "$baseDir" -maxdepth 1 \
  -type d -name "*master*" \
  -printf '%h\0%d\0%f\n' | \
  sort -t '\0' -n | \
  awk -F '\0' '{print $3}'
  )
amountAllRepos=$(echo "$allRepos" | wc -w | xargs)

echo "$amountAllRepos Repositories found..."

# move to projects dir.
cd ${baseDir} || exit 1

repoCounter=1

# first define and export a function to process one repository
# $1: total, $2: repository, $3: count.

updateRepo() {
printf 'Checking %s (%d/%d)\n' "$2" "$3" "$1"
dir="${2%.git}"; dir="${dir##*/}"
if [ -d "$dir" ]; then
  cd $dir || exit 1
  #printf '  Already cloned. Updating\n'
  dnam=$dir
  tarnam=${dnam}.tar.xz
if git remote update && git status -uno 2>&1 | grep -E -qi 'Your branch is behind'; then
  echo "${dir} Matched..."
  git pull
  cd .. || exit 1
  tar -cjf $tarnam $dir
  echo "${dir} Updated successfully $(date -Is)..."
else
  cd .. || exit
  echo "$(date -Is) No pull needed '$2' up-to-date"
fi     
fi
}
export -f updateRepo


# counter end point.
repoCounter=$((repoCounter + 1))

# build a bash indexed array (repos) in which 
# 2 consecutive cells contain
# the repository/dir name and the count.

declare -a repos=() tmp=( $allRepos )
declare -i n=1 t="${#tmp[@]}"

for repo in "${tmp[@]}"; do
  repos+=( "$repo" "$n" )
  (( n += 1 ))
done

# pass the array to xargs, 2 entries at a time (-n2), with,
# e.g., up to 8 jobs in parallel (-P8), and let it use our
# function to process each repository.
# use -P to control number of jobs running P1 is best as it 
# puts each jobs output consecutively in terminal if viewed.
# For very large numbers of repos increase upto 8 and log 
# output and sort by numeric.

printf '%s\n' "${repos[@]}" | xargs -P1 -n2 bash -c 'updateRepo "$@"' "bash" "$t"

# End of script, calculate time taken to process repos.
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took ${DIFF} seconds to check ${amountAllRepos} repositories."

