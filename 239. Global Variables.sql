# Contoh Global Variable:

SET GLOBAL max_connections = 1000;
SET @@global.max_connections = 1;

# Contoh Global Variable yang x boleh ditukar menjadi Session Variable:

SET GLOBAL max_connections = 1000;

# Contoh GV yang boleh ditukar menjadi SV:

SET SESSION sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION'; 
SET GLOBAL sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';