<div align="center">
<img src="assets/brand-logo.svg" alt="Arya Fatthurahman" width="120" />
</div>

# Vertica Lab

<sub>Practice Vertica SQL: projections, segmentation, `COPY`, and a columnar query workflow.</sub>

<p>
  <img src="https://img.shields.io/badge/Database-Vertica-E4002B?style=flat-square" alt="Database: Vertica" />
  <img src="https://img.shields.io/badge/Category-Columnar%20analytics-6366F1?style=flat-square" alt="Category: Columnar analytics" />
  <img src="https://img.shields.io/badge/Runs%20in-Cloud-0EA5E9?style=flat-square&logo=icloud&logoColor=white" alt="Runs in Cloud" />
  <img src="https://img.shields.io/badge/License-MIT-22C55E?style=flat-square" alt="License: MIT" />
</p>

## What this lab is

Vertica is a columnar analytics database with a strong focus on projections and segmentation. This lab is install-based because the old community Docker image is no longer published under the `vertica/vertica-ce` name. It gives you the DDL, projection, and `COPY` patterns to run against a local Community Edition or a licensed Vertica instance.

## Quickstart

1. Install Vertica Community Edition (RPM/DEB) or start a licensed Vertica instance/VM.
2. Create a database named `lab` and connect with `vsql -h localhost -U dbadmin -d lab`.
3. Run `examples/01_setup.sql` to create the schema and a projection.
4. Run `examples/02_queries.sql` to seed and query the data.
5. Use `EXPLAIN` to see which projection the optimizer chooses.

## Connection details

| Field | Value |
| --- | --- |
| Host | `localhost` |
| Port | `5433` |
| Database | `lab` |
| User | `dbadmin` |
| vsql | `vsql -h localhost -U dbadmin -d lab` |
| JDBC URL | `jdbc:vertica://localhost:5433/lab` |

## Examples

| File | What it shows |
| --- | --- |
| [`examples/01_setup.sql`](examples/01_setup.sql) | Schema, table, and an explicit projection. |
| [`examples/02_queries.sql`](examples/02_queries.sql) | Seed data, aggregation, and `EXPLAIN`. |

## Exercises

1. Create a second projection sorted by `sold_at` and compare plans for a date-range query.
2. Load a CSV with `COPY lab.sales FROM LOCAL '...' DELIMITER ','`.
3. Add a segmentation expression and explain when it helps a join.
4. Use `PROJECTION_COLUMNS` to inspect column encoding.

## Notes and limits

- The historical `vertica/vertica-ce` Docker image is no longer available on Docker Hub under that name; this lab does not depend on it.
- Vertica Community Edition has a data-size limit. Check the current license terms before loading a large dataset.
- Projections are the physical design unit in Vertica; a table can have several.
- `SELECT REFRESH('')` refreshes all projections; in a real deployment you would scope it.

## Run it from anywhere

This lab already runs in the provider's cloud. To use it from another country safely:

- Keep the account behind MFA and restrict network access to your IP or VPN where the provider allows it.
- Use a dedicated lab user with the minimum privileges; never reuse personal credentials.
- Store tokens and passwords in a secret manager or environment variables, never in the repository.
- Stop or delete the warehouse, cluster, or VM when you finish to control cost.

The shared checklist and provider map are in **[REMOTE-ACCESS.md](https://github.com/devarent/database-labs/blob/main/REMOTE-ACCESS.md)**.

## References

- [Vertica documentation](https://docs.vertica.com/)
- [Vertica Community Edition](https://www.vertica.com/try/)
- [vsql reference](https://docs.vertica.com/latest/en/using-vsql/)

---

<sub>Part of the <a href="https://github.com/devarent/database-labs">database-labs</a> collection: 26 database engines, one index.</sub>

## License

MIT (c) 2026 Arya Fatthurahman. See [LICENSE](LICENSE).
