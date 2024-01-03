variable "cidr_block"{
    type= string
    default= "10.0.0.0/16"
}

variable "users_list" {
type=list
default= ["Ram","Ankit","Shweta"]
}

variable "EC2"{}

variable "port"{
    type= number
    default= 22 
}

variable "ports"{
    type= list(number)
    default= [22,80,3000,5000,8080]
}

