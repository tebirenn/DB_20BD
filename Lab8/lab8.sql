--1.a--
CREATE or REPLACE FUNCTION a(x integer)
RETURNS integer AS
    $$
        begin
        return x+1;
        end;
    $$
language 'plpgsql';

select a(9);
drop function a;

--1.b--
CREATE or REPLACE FUNCTION b(a integer, b integer)
returns integer as
    $$
        begin
            return a+b;
        end
    $$
language 'plpgsql';

select b(8,11);
drop function b;

--1.c--
CREATE or REPLACE FUNCTION c(x integer)
returns boolean as
    $$
        begin
            return x % 2 = 0;
        end;
    $$
language 'plpgsql';

select c(1001);
drop function c;

--1.d--
CREATE or REPLACE FUNCTION d(x text)
returns boolean as
    $$
        begin
            return exists(select REGEXP_MATCHES(x,'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'));
        end;
    $$
language 'plpgsql';

select d('12345678a');
drop function d;

--1.e--
CREATE FUNCTION e(a integer,out b varchar,out c varchar) as
    $$
    begin
        b=a+5;
        c=a*2;
    end;
    $$
language  'plpgsql';

select * from e(1);
drop function e;

--3--
-- Procedures are basic PL SQL blocks to perform a specific action.Procedures will not return the value
-- Functions are blocks used mainly to perform the computations.Functions must return the value.