gh api --paginate /repos/scottgriv/username/reponame/actions/runs | \
jq -r '.workflow_runs[] | [.id] | @tsv' | \
while read -r value; do 
    echo "Deleting $value"
    gh api -X DELETE "/repos/scottgriv/username/reponame/actions/runs/$value"
done
