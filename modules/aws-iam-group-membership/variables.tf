variable "group_membership_name" {
    type = string
    description = "Group membership name"
}

variable "group_membership_users" {
    type = list(string)
    description = "Users inside that group"
}

variable "group_membership_group" {
    type = string
    description = "Group name"
}