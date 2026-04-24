## Каталог событий

| Событие | Контекст-источник | Семантика | Ключевые поля контракта (минимальные) |
|--------|-------------------|-----------|---------------------------------------|
| AccountCreated | Finance / Account Management | Создан новый счёт | accountId, customerId, currency, timestamp |
| CreditAgreementCreated | Finance / Credit Management | Создан новый кредитный договор | agreementId, customerId, amount, currency, interestRate, timestamp |
| PaymentReceived | Finance / Payment Processing | Поступил платёж по договору | transactionId, agreementId, amount, timestamp |
| CreditAgreementClosed | Finance / Credit Management | Договор полностью погашен или закрыт | agreementId, closeReason, timestamp |
| PatientRegistered | Healthcare / Patient Management | Новый пациент зарегистрирован в системе | patientId, fullName, dateOfBirth, timestamp |
| DiagnosticOrderPlaced | Healthcare / Clinical Decision | Назначено диагностическое исследование | orderId, patientId, testType, timestamp |
