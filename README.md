<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
## POS Terminal Communication Module

This module facilitates communication with POS terminals using the TTK protocol. It provides essential functionalities for handling payments, refunds, and services.

### Features

- Connectivity: Establish connection with the POS terminal.
- Disconnection: Terminate connection with the POS terminal.
- Payment Creation: Initiate payment transactions.
- Refund Creation: Process refunds for completed transactions.
- Service Creation: Execute various service operations on the POS terminal.

### Installation

To utilize this module in your project, follow these steps:

1. Add the module to your project dependencies.
2. Import the POSPaymentModule class.
3. Initialize the module with the IP address and port of the POS terminal.


import 'pos_payment_module.dart';

final posModule = POSPaymentModule(ip: 'terminal_ip_address', port: 1234);


### Usage

#### Connecting to the POS Terminal


await posModule.connect();


#### Creating a Payment


final paymentResponse = await posModule.createPayment(
  amount: 100.0,
  clientId: 'client_id',
  idempotenceKeyERN: 'idempotence_key_ern',
);


#### Creating a Refund


final refundResponse = await posModule.createRefund(
  amount: 50.0,
  retrievalReferenceNumber: 'reference_number',
  clientId: 'client_id',
  idempotenceKeyERN: 'idempotence_key_ern',
);


#### Creating a Service Operation


final serviceResponse = await posModule.createService(
  clientId: 'client_id',
  operationServiceType: OperationServiceType.SOME_TYPE,
  idempotenceKeyERN: 'idempotence_key_ern',
);


### Contribution

Contributions to this project are welcome. Feel free to submit bug reports, feature requests, or pull requests.

### License

This project is licensed under the [MIT License](LICENSE).