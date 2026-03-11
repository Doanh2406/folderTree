 ## Folder Tree using Materialized Path

This project stores hierarchical folders using the **Materialized Path** pattern.

Each folder stores its full path from the root in the `path` column.
### folders

| Column | Type | Description |
|------|------|-------------|
| id | bigint | Folder ID |
| name | string | Folder name |
| path | string | Full path from root |
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


### Endpoint: GET /folders/:id

### Response

```json
{
  "id": 2,
  "name": "Folder A",
  "children": [
    {
      "id": 4,
      "name": "Folder A1",
      "children": [
        {
          "id": 8,
          "name": "Folder A1-1",
          "children": []
        }
      ]
    },
    {
      "id": 5,
      "name": "Folder A2",
      "children": []
    }
  ]
}
