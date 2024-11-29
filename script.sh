git_branch_recreate(){
    current_branch=$(git branch --show-current)
    git checkout main
    files=$(git diff --name-only main $current_branch)
    for file in $files; do
        git checkout $current_branch -- $file
    done
    git stash
    git checkout -b $current_branch-refactor
    git stash pop
}