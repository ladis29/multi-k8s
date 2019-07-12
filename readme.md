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

Nesta etapa prepararemos a parte de CI/CD do projeto, seguiremos o seguinte cronograma:
<body>
	<center>	
		<img src="./pictures/preparando_travis.png" width="500" height="300">
	</center>
</body>

