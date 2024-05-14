enum ApiPOSOperationServiceType {
  CHECK_SUM('2'),
  TERMINAL_TEST('3'),
  BANK_HOST_TEST('4'),
  PRINT_REPORT_MENU('5'),
  NFC_READER_COMMAND('6'),
  CLEAR_HOST_KEYS('7'),
  SYNC_LOG('8'),
  CALL_APP_MENU('C'),
  UPDATE_FW('D'),
  ;

  final String value;
  const ApiPOSOperationServiceType(this.value);
}
