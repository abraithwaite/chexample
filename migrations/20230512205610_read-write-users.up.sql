CREATE USER runreveal IDENTIFIED WITH sha256_hash BY '1F89C1027AFE5C3B5175A4EF7564298BBB93194FD80F53A7EF32D23B82AA7702' SALT '191228FE24138D6976F3680A28AC8CFFEF8EB42FA815A013D03814C0AC93D1D3'
;

GRANT  CURRENT GRANTS ON *.* TO runreveal WITH GRANT OPTION
;
