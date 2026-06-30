# Call RuboCop autofix only on staged files
#
function rubocop-fix-staged
  bundle exec rubocop -a $(git diff --staged --name-only)
end
