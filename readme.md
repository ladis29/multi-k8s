Essa documentação tem o objetivo de criar um projeto e rodá-lo em um cluster kubernetes no GCP do zero. A sequência adotada será a seguinte:
<body>
	<center>
        <img src="./pictures/objetivo.png" width="400" height="200">
	</center>
</body>

# Criando um projeto no GCP

- Antes de criar o projeto pode-se verificar o custo médio do projeto usando a calculadora do GCP: https://cloud.google.com/products/calculator/
- Acessar o console do GCP em https://console.cloud.google.com
- Clicar em `Projects`, irá abrir uma nova janela, clicar em "NEW PROJECT" dar o nome ao projeto e criar
- Habilitar a Cobrança para o projeto recém criado
    - No menu de navegação(Canto superior esquerdo) encontrar e clicar no item `Billing`
    - Em Billing selecionar`Link a billing account`, selecionar a conta de cobrança para o projeto e clicar em `SET ACCOUNT`

# Criando o cluster kubernetes

- No menu de navegação ir até a seção `COMPUTE` e selecionar o item `Kubernetes Engine`
- Irá abrir uma nova página carregando a função no projeto, pode demorar um pouco.
    **NOTA** no canto superior direito, próximo à imagem do titular da conta haverá um ícone com a imagem de um sino que terá uma barra de progresso girando em torno. Essa informação é mais confiável do que a informação de progresso que aparece no centro da tela.
- Assim que o serviço estiver habilitado podemos clicar em `Create Cluster` na janela que terá no centro da tela.
- Ná página que abrirá selecionar as características desejadas para o novo cluster, ao concluir clique em create.
- Assim que a criação do cluster for concluída vc poderá acessar o cluster clicando nele
- No canto esquerdo da tela teremos o menu do cluster onde poderemos verificar e configurar suas características(storage classes, ingress, workloads...).
- Em Storage temos os Storage Classes que por padrão vem com um persistent disk.

# Preparando o GITLAB/TRAVIS

Nesta etapa começaremos a preparar a parte de CI/CD do projeto, seguiremos o seguinte cronograma:
<body>
	<center>	
		<img src="./pictures/preparando_travis.png" width="500" height="300">
	</center>
</body>

- A primeira necessidade é instalar o CLI do GCP SDK no projeto, para isso colocaremos na seção `before_install` do nosso arquivo de configuração do projeto(`.gitlab-ci.yaml` ou `.travis.yml`) a seguintes linhas de comando:

```sh
...
  - curl https://sdk.cloud.google.com | bash > /dev/null
  - source $HOME/google-cloud-sdk/path.bash.inc
...
```

- Precisamos também instalar o `kubectl` no nosso cluster para que possamos rodar comandos direto da interface CLI do cluster, para ainda na seção `before_install` do nosso arquivo de configuração do projeto iremos inserir a seguinte linha:

```sh
...
  - gcloud components update kubectl
...
```
 - O próximo passo é passar as informações de login do GCP para o projeto, faremos isso adicionando a linha:
 ```sh
...
  - gcloud auth activate-service-account --key-file service-account.json
...
```

### Criando a conta de serviço para o projeto e adicionando ao TRAVIS/GITLAB

<body>
	<center>	
		<img src="./pictures/credenciais.png" width="300" height="200">
	</center>
</body>

 - No menu de navegação do GCP ir até a seção `IAM & admin`
 - Na página que se abrirá, lado esquerdo da tela selecionar `Service accounts`
 - Na parte central, superior clicar em `+CREATE SERVICE ACCOUNT`
 <body>
	<center>	
		<img src="./pictures/create_service_account.png" width="350" height="80">
	</center>
</body>