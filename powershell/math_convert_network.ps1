# Example convert 64 Mega Bytes per second to Mega Bits per second network rate

64*[math]::pow(2,20)*8/1e6

# 536.870912

# 1 Mega Byte = 2^20 Bytes
# 1 Byte = 8 Bits
# 1 Mega Bit = 10^6 Bits

# Show with thousands separator (bits per second). String format operator.

'{0:N0}' -f (64*[math]::pow(2,20)*8)

# 536,870,912

# Default Precision from [System.Globalization.CultureInfo]::CurrentCulture.NumberFormat.NumberDecimalDigits
# For en-US, default decimal digits is Two (2) ... to suppress this, format string used Zero (0).
# https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-numeric-format-strings
