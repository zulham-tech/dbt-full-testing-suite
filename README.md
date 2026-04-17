# dbt Full Testing Suite — Production Data Quality

![dbt](https://img.shields.io/badge/dbt-FF694B?style=flat&logo=dbt&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat&logo=postgresql&logoColor=white)
![BigQuery](https://img.shields.io/badge/BigQuery-4285F4?style=flat&logo=googlebigquery&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)

A reference dbt project demonstrating enterprise-grade data testing: schema tests, custom singular tests, dbt unit tests (dbt 1.8+), data contracts, Great Expectations integration, and GitHub Actions CI/CD.

## Architecture

```mermaid
graph TD
    A[Raw Sources] --> B[dbt Staging Models]
    B --> C[dbt Intermediate Models]
    C --> D[dbt Marts - Star Schema]

    subgraph Tests[Testing Layers]
        T1[Schema Tests - not_null, unique, FK]
        T2[Custom Singular Tests - Business Rules]
        T3[dbt Unit Tests - dbt 1.8+]
        T4[Great Expectations - Statistical Checks]
    end

    Tests --> B
    Tests --> C
    Tests --> D
    D --> E[BI Dashboard]
    F[GitHub Actions CI] --> Tests
```

## Test Coverage

| Test Type | Count | Scope |
|-----------|-------|-------|
| Schema tests (built-in) | 45+ | All models |
| Custom singular tests | 12 | Business logic |
| dbt unit tests | 8 | Complex macros |
| Great Expectations suites | 5 | Critical datasets |

## Quick Start

```bash
git clone https://github.com/zulham-tech/dbt-full-testing-suite.git
cd dbt-full-testing-suite
pip install dbt-bigquery dbt-utils
dbt deps
dbt build          # run models + all tests
dbt docs generate && dbt docs serve
```

## Project Structure

```
.
├── models/
│   ├── staging/         # Source cleaning and type casting
│   ├── intermediate/    # Business logic layer
│   └── marts/           # Star schema (dim_ + fct_ tables)
├── tests/
│   ├── singular/        # Custom SQL data tests
│   └── unit/            # dbt unit tests (v1.8+)
├── macros/              # Reusable SQL macros
├── analyses/            # Ad-hoc analytical queries
├── dbt_project.yml
└── packages.yml
```

## Author

**Ahmad Zulham Hamdan** — [LinkedIn](https://linkedin.com/in/ahmad-zulham-665170279) | [GitHub](https://github.com/zulham-tech)
