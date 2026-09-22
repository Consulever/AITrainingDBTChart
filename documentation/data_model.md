# Data model

The dataset is the TPC-H benchmark schema.

It models a wholesale supplier: **customers** place **orders** made of **line items**; each line item ships one **part** from one **supplier**; customers and suppliers belong to a **nation**, which belongs to a **region**.

## Entity relationship diagram

```mermaid
erDiagram
    REGION ||--o{ NATION : "groups"
    NATION ||--o{ CUSTOMER : "is home of"
    NATION ||--o{ SUPPLIER : "is home of"
    CUSTOMER ||--o{ ORDERS : "places"
    ORDERS ||--|{ LINEITEM : "contains"
    PART ||--|{ PARTSUPP : "is offered in"
    SUPPLIER ||--|{ PARTSUPP : "offers"
    PARTSUPP ||--o{ LINEITEM : "is sold as"

    REGION {
        INTEGER r_regionkey PK
        VARCHAR r_name
        VARCHAR r_comment
    }
    NATION {
        INTEGER n_nationkey PK
        VARCHAR n_name
        INTEGER n_regionkey FK
        VARCHAR n_comment
    }
    CUSTOMER {
        BIGINT c_custkey PK
        VARCHAR c_name
        VARCHAR c_address
        INTEGER c_nationkey FK
        VARCHAR c_phone
        DECIMAL c_acctbal
        VARCHAR c_mktsegment
        VARCHAR c_comment
    }
    SUPPLIER {
        BIGINT s_suppkey PK
        VARCHAR s_name
        VARCHAR s_address
        INTEGER s_nationkey FK
        VARCHAR s_phone
        DECIMAL s_acctbal
        VARCHAR s_comment
    }
    PART {
        BIGINT p_partkey PK
        VARCHAR p_name
        VARCHAR p_mfgr
        VARCHAR p_brand
        VARCHAR p_type
        INTEGER p_size
        VARCHAR p_container
        DECIMAL p_retailprice
        VARCHAR p_comment
    }
    PARTSUPP {
        BIGINT ps_partkey PK, FK
        BIGINT ps_suppkey PK, FK
        BIGINT ps_availqty
        DECIMAL ps_supplycost
        VARCHAR ps_comment
    }
    ORDERS {
        BIGINT o_orderkey PK
        BIGINT o_custkey FK
        VARCHAR o_orderstatus
        DECIMAL o_totalprice
        DATE o_orderdate
        VARCHAR o_orderpriority
        VARCHAR o_clerk
        INTEGER o_shippriority
        VARCHAR o_comment
    }
    LINEITEM {
        BIGINT l_orderkey PK, FK
        BIGINT l_linenumber PK
        BIGINT l_partkey FK
        BIGINT l_suppkey FK
        DECIMAL l_quantity
        DECIMAL l_extendedprice
        DECIMAL l_discount
        DECIMAL l_tax
        VARCHAR l_returnflag
        VARCHAR l_linestatus
        DATE l_shipdate
        DATE l_commitdate
        DATE l_receiptdate
        VARCHAR l_shipinstruct
        VARCHAR l_shipmode
        VARCHAR l_comment
    }
```
