# 🚀 Rockelivery

![GitHub repo size](https://img.shields.io/github/repo-size/joabehenrique/rockelivery?style=flat)
![GitHub language count](https://img.shields.io/github/languages/count/joabehenrique/rockelivery?style=flat)
![GitHub forks](https://img.shields.io/github/forks/joabehenrique/rockelivery?style=flat)
![Bitbucket open issues](https://img.shields.io/bitbucket/issues/joabehenrique/rockelivery?style=flat)
![Bitbucket open pull requests](https://img.shields.io/bitbucket/pr-raw/joabehenrique/rockelivery?style=flat)

> The project developed is an API for restaurant ordering.

## 💻 Requirements

Before you begin, make sure you have met the following requirements:

- You need the latest version of `Elixir/Phoenix` and `PostgreSQL` on your machine.

If you need installation instructions, [click here](https://hexdocs.pm/phoenix/installation.html).

## 🚀 Installing Rockelivery

To install Rockelivery, follow these steps:

1º Clone the repository.

```
>  git clone https://github.com/joabehenrique/rockelivery.git
```
2º Open the project in your vscode and run the command
```
> mix deps.get
```
3º Just run project
```
> mix phx.server
```
## ☕ Using Rockelivery

To use Rockelivery, follow these steps:

```
Rocketlivery is a project where we use phoenix to manage new users, 
delete, update their information or just search for existing users.

Ecto was used for persisting the data in the PostgreSQL database,
doing several validations before and error handling in the requests. 
```

Getting a user
```
(GET) api/v1/user/{id}
```
Deleting a user
```
(DELETE) api/v1/user/{id}
```
Creating a user
```
(POST) api/v1/user

{
    "name": "Joabe Henrique",
    "email": "henriquecidoz@hotmail.com",
    "cep": "12345678",
    "cpf": "12345678900",
    "address": "Rua Cristovao, n 94º",
    "password": "jaue7235!@",
    "age": 20
}
```
Changing a user
```
(PUT) api/v1/user/{id}

{
    "name": "Joabe Henrique Carvalho",
    "email": "joabe.souza@gmail.com",
    "cep": "87654321",
}
```
Creating a item

(_Possible Categories_: `food`, `desert`, `drink`.)
```
(POST) api/v1/item

{
    "description": "PIZZA PORTUGUESA - PifPaf ",
    "category": "food",
    "price": "21.98",
    "photo": "https://www.aws.s3/pizza.png"
}
```
Creating a order

(_Possible Payment Method_: `money`, `credit_card`, `debit_card`.)
```
(POST) api/v1/order

{
    "items" : [
        {
            "id": "ba4ccd7e-94d5-4c7f-a76d-77ed9418bb46",
            "quantity": 2
        }, 
        {
            "id": "c4e8b1d9-afc3-4537-ad8e-2c42432488a6", 
            "quantity" : 3
        }
    ], 
    "user_id": "865e5769-1f64-4b9e-b2ef-cd137fafb020",
    "address" : "Rua Cristovao 90",
    "payment_method" : "money",
    "comments" : "Mandar mensagem ao chegar"
}
```


## 📫 Contributing to Rockelivery

To contribute to Rockelivery, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <nome_branch>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Send to the original branch: `git push origin Rockelivery / <local>`
5. Create the pull request.

Alternatively, see the GitHub documentation at [how to create a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)..

## 🤝 Author and Contributors

We thank the following people who contributed to this project:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/joabehenrique">
        <img src="https://avatars3.githubusercontent.com/u/64988299" width="100px" style="border-radius: 90px" alt="Foto do Joabe Henrique no GitHub"/><br>
        <sub>
          <b>Joabe Henrique [Author]</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

## 😄 Be one of the contributors<br>

Do you want to be part of this project? Click [here](https://github.com/joabehenrique/rockelivery/blob/master/CONTRIBUTING.md) and read how to contribute.

## 📝 License

This project is under license. See the [license](https://github.com/joabehenrique/rockelivery/blob/master/LICENSE.md) file for more details.