## Переменные и секреты

### Terraform-переменные (задаются в Task1Advanced/envs/<env>/terraform.tfvars для окружений dev, stage, prod)

- availability_zone – зона доступности Yandex Cloud
- vm_image – ID образа для виртуальной машины
- vm_name – имя создаваемой ВМ
- vm_cores – количество vCPU
- vm_memory – объём RAM (ГБ)
- vm_disk_name – имя загрузочного диска
- vm_disk_type – тип диска (например, network-hdd)
- vm_disk_size – размер диска (ГБ)
- subnet_id – идентификатор подсети, в которой размещается ВМ
- ssh_key – публичный SSH-ключ (значение подставляется из GitHub Secrets, в файлах переменных не прописывается)

### Секреты GitHub, необходимые для CI

| Секрет | Назначение |
|--------|------------|
| SSH_PUBLIC_KEY | Публичный ключ для доступа к ВМ |
| YC_SERVICE_ACCOUNT_KEY | JSON-ключ сервисного аккаунта Yandex Cloud |
| ACCESS_KEY | Идентификатор статического ключа Object Storage |
| SECRET_KEY | Секрет статического ключа Object Storage |