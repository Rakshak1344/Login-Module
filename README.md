# Login Auth

Login Module

## API reference

base url https://task-auth-endpoint-api.herokuapp.com

# Routes and input

## POST
/users - Creates user signup. Inputs->(name,email,password,age) <br />
/users/login - Login action signin. Inputs->(email,password) <br />
/users/logout - Logouts current user. <br />
/users/logoutAll - Logouts all devices of the user. <br />
/users/me/avatar - Upload user avatar(Key is avatar). <br />
/tasks - Add task. Inputs->(description,completed(type-bool)) <br />

## GET
/users/me - Get current user profile. <br />
/users/id - Get user by ID. <br />
/users/id/avatar - Get user avatar by ID. <br />
/tasks?sortBy=createdAt:desc - Get all task of current user. <br />
/tasks/id - Get task by ID. <br />

## PATCH
/users/me - Update user profile. Inputs->(name,email,password,age) <br />
/tasks/id - Update task by ID. <br />

## DELETE
/users/me - Delete current user. <br /> 
/users/me/avatar - Delete User avatar. <br />
/tasks/id - Delete task by ID. <br />




