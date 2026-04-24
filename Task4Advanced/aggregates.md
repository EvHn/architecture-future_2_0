## Ключевые агрегаты

### 1 Финансы

- Кредитный договор (CreditAgreement)
  - Корень агрегата: agreementId
  - Инварианты: сумма кредита > 0, ставка 0–100%, дата окончания > даты начала
  - Дочерние сущности: PaymentSchedule (график платежей), Borrower (заёмщик)
  - События: CreditAgreementCreated, CreditAgreementSigned, PaymentDueDateReached

- Счёт (Account)
  - Корень: accountId  
  - Инварианты: Сумма положительная
  - События: AccountCreated, AccountClosed.

- Транзакция (Transaction)
  - Корень: transactionId
  - Связь: accountId
  - Инварианты: сумма транзакции больше нуля
  - События: PaymentReceived, FeeApplied

### 2 Медицина

- Данные пациента (Patient)
  - Корень: patientId
  - Инварианты: обязательные поля (ФИО, дата рождения), уникальность идентификационного номера (Паспорт, полис ОМС)
  - События: PatientRegistered, PatientDemographicsUpdated

- Медицинская карта (Medical record)  
  - Корень: cardId  
  - Связь: patientId  
  - Инварианты: -
  - События: DiagnosticResultPlaced, MedicalRecordUpdated 
