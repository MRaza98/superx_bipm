
CREATE TABLE Conversion_factors (
    currency_from VARCHAR(3),
    currency_to VARCHAR(3),
    factor DECIMAL(10, 2),
    PRIMARY KEY (currency_from, currency_to)
);

INSERT INTO conversion_factors (currency_to, currency_from, factor)
VALUES 
    ('EUR', 'USD', 0.92),
    ('EUR', 'GBP', 1.17),
    ('EUR', 'CAD', 0.69),
    ('EUR', 'PLN', 0.23),

    ;
