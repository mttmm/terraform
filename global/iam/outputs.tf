/*  LEGACY
output "all_arns" {
  value       = aws_iam_user.example[*].arn
  description = " The ARNs for all users"
}
*/

output "all_users" {
  value = aws_iam_user.example
}
