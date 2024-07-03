## POS Terminal Communication Module

This module facilitates communication with POS terminals using the TTK protocol. It provides essential functionalities for handling payments, refunds, and services.

### Features

- **Connectivity**: Establish connection with the POS terminal.
- **Disconnection**: Terminate connection with the POS terminal.
- **Payment Creation**: Initiate payment transactions.
- **Refund Creation**: Process refunds for completed transactions.
- **Service Creation**: Execute various service operations on the POS terminal.

### Installation

To utilize this module in your project, follow these steps:

1. Add the module to your project dependencies.
2. Import the `POSPaymentModule` class.
3. Initialize the module with the IP address and port of the POS terminal.

```dart
import 'pos_payment_module.dart';

final posModule = POSPaymentModule(ip: 'terminal_ip_address', port: 1234);
```

### Usage

#### Connecting to the POS Terminal

```dart
await posModule.connect();
```

#### Creating a Payment

```dart
final paymentResponse = await posModule.createPayment(
  organizationCode: null,
  amount: 100.0,
  clientId: 'client_id',
  idempotenceKeyERN: 'idempotence_key_ern',
);
```

#### Creating a Refund

```dart
final refundResponse = await posModule.createRefund(
  organizationCode: null,
  amount: 50.0,
  retrievalReferenceNumber: 'reference_number',
  clientId: 'client_id',
  idempotenceKeyERN: 'idempotence_key_ern',
);
```

#### Creating a Service Operation

```dart
final serviceResponse = await posModule.createService(
  organizationCode: null,
  clientId: 'client_id',
  operationServiceType: OperationServiceType.SOME_TYPE,
  idempotenceKeyERN: 'idempotence_key_ern',
);
```

#### Abort operation
Abort operation is not async function, because it has not result data, bool flag is just result of success or unsuccess creation. The result of aborting the operation will be received in the operation that you aborted.
```dart
bool stopSuccess = posModule.createAbort(
  organizationCode: null,
  clientId: 'client_id',
  idempotenceKeyERN: 'idempotence_key_ern',
);
```

### Contribution

Contributions to this project are welcome. Feel free to submit bug reports, feature requests, or pull requests.

### License

This project is licensed under the [MIT License](LICENSE).
