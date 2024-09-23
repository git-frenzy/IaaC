terraform {}

variable "num_list" {
  type    = list(number)
  default = [1, 2, 3, 4, 5]
}


variable "person_list" {
  type = list(object({
    fname = string
    lname = string
  }))

}
