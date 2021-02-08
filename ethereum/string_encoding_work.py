# analysis of string in Ethereum smart-contract constructor parameter value to verify source-code.

b = bytes.fromhex('2320536574205742544320436f6c6c61746572616c20466163746f7220746f203735250a54686973206368616e676520696e637265617365732074686520436f6c6c61746572616c20466163746f72206f6620574254432066726f6d2036302520746f203735252e200a0a4f6e204f63746f626572203173742c2050726f706f73616c203234207761732070617373656420746f2072616973652057425443e280997320436f6c6c61746572616c20466163746f722066726f6d2034302520746f203630252e204163636f7264696e6720746f20446566692050756c73652c206f6e204f63746f626572203173742c2074686572652077657265207e243142206f66205742544320696e2063697263756c6174696f6e2e20546f646179207468657265206172652024342e333842206f66205742544320696e2063697263756c6174696f6e2e20496e206164646974696f6e20746f20686176696e672061206d756368206c617267657220737570706c7920746f6461792c2057425443206c697175696469747920686173207369676e69666963616e746c792067726f776e2073696e63652050726f706f73616c20323420776173207061737365642e0a0a556e69737761703a20243135304d0a5375736869737761703a20243235364d0a42616c616e6365723a20243230304d0a31696e63683a20243136304d0a0a496e206164646974696f6e20746f2067726f77696e67206c6971756964697479206f6e20646563656e7472616c697a65642065786368616e6765732c2063656e7472616c697a65642065786368616e6765732061726520636f6e74696e75696e6720746f2061646f707420574254432e2053686f72746c792061667465722050726f706f73616c203234207061737365642c20436f696e626173652061646465642057425443206d61726b6574732e2041732077656c6c2c2042696e616e636520636f6e74696e75657320746f20626520612067726f77696e672068756220666f7220574254432f4254432074726164696e672e200a0a5769746820746865207369676e69666963616e7420696e63726561736520696e20574254432063697263756c6174696f6e2c206c69717569646974792c20616e6420696e6672617374727563747572652c206974206973207361666520666f7220436f6d706f756e6420746f20696e63726561736520436f6c6c61746572616c20466163746f7220746f203735252e2046726f6d20612067726f7774682f627573696e657373207374616e64706f696e742c20414156452063757272656e746c79206861732069747320436f6c6c61746572616c20466163746f722073657420746f203735252e20436f6d706f756e642046696e616e6365206e6565647320746f2072656d61696e20636f6d706574697469766520746f2061766f6964206c6f73696e67206d61726b65742073686172652e')

# print the value (b)
# ... noticed some \n\n double newlines
# ... noticed \xe2\x80\x99 utf8 value for "Right Single Quotation Mark"
# ....  see also https://unicode-table.com/en/2019/
# ....  in javascript string, write it as '\u2019'

hex(len(b))
