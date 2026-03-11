 ## Folder Tree using Materialized Path

This project stores hierarchical folders using the **Materialized Path** pattern.

Each folder stores its full path from the root in the `path` column.

Example:

id | name | path
---|------|-----
1  | root | 1
2  | A    | 1/2
4  | A1   | 1/2/4
8  | A1-1 | 1/2/4/8

To retrieve all descendant folders, a prefix query is used:

```sql
SELECT *
FROM folders
WHERE path LIKE '1/2/%'
ORDER BY path;