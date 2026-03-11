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
Example :GET /folders/:2
```json
{
    "id": 2,
    "name": "Folder A",
    "path": "1/2",
    "children": [
        {
            "id": 4,
            "name": "Folder A1",
            "path": "1/2/4",
            "children": [
                {
                    "id": 8,
                    "name": "Folder A1-1",
                    "path": "1/2/4/8",
                    "children": []
                },
                {
                    "id": 9,
                    "name": "Folder A1-2",
                    "path": "1/2/4/9",
                    "children": []
                },
                {
                    "id": 8,
                    "name": "Folder A1-1",
                    "path": "1/2/4/8",
                    "children": []
                },
                {
                    "id": 9,
                    "name": "Folder A1-2",
                    "path": "1/2/4/9",
                    "children": []
                }
            ]
        },
        {
            "id": 5,
            "name": "Folder A2",
            "path": "1/2/5",
            "children": [
                {
                    "id": 10,
                    "name": "Folder A2-1",
                    "path": "1/2/5/10",
                    "children": []
                },
                {
                    "id": 11,
                    "name": "Folder A2-2",
                    "path": "1/2/5/11",
                    "children": []
                },
                {
                    "id": 10,
                    "name": "Folder A2-1",
                    "path": "1/2/5/10",
                    "children": []
                },
                {
                    "id": 11,
                    "name": "Folder A2-2",
                    "path": "1/2/5/11",
                    "children": []
                }
            ]
        },
        {
            "id": 6,
            "name": "Folder A3",
            "path": "1/2/6",
            "children": [
                {
                    "id": 12,
                    "name": "Folder A3-1",
                    "path": "1/2/6/12",
                    "children": []
                },
                {
                    "id": 12,
                    "name": "Folder A3-1",
                    "path": "1/2/6/12",
                    "children": []
                }
            ]
        },
        {
            "id": 4,
            "name": "Folder A1",
            "path": "1/2/4",
            "children": [
                {
                    "id": 8,
                    "name": "Folder A1-1",
                    "path": "1/2/4/8",
                    "children": []
                },
                {
                    "id": 9,
                    "name": "Folder A1-2",
                    "path": "1/2/4/9",
                    "children": []
                },
                {
                    "id": 8,
                    "name": "Folder A1-1",
                    "path": "1/2/4/8",
                    "children": []
                },
                {
                    "id": 9,
                    "name": "Folder A1-2",
                    "path": "1/2/4/9",
                    "children": []
                }
            ]
        },
        {
            "id": 5,
            "name": "Folder A2",
            "path": "1/2/5",
            "children": [
                {
                    "id": 10,
                    "name": "Folder A2-1",
                    "path": "1/2/5/10",
                    "children": []
                },
                {
                    "id": 11,
                    "name": "Folder A2-2",
                    "path": "1/2/5/11",
                    "children": []
                },
                {
                    "id": 10,
                    "name": "Folder A2-1",
                    "path": "1/2/5/10",
                    "children": []
                },
                {
                    "id": 11,
                    "name": "Folder A2-2",
                    "path": "1/2/5/11",
                    "children": []
                }
            ]
        },
        {
            "id": 6,
            "name": "Folder A3",
            "path": "1/2/6",
            "children": [
                {
                    "id": 12,
                    "name": "Folder A3-1",
                    "path": "1/2/6/12",
                    "children": []
                },
                {
                    "id": 12,
                    "name": "Folder A3-1",
                    "path": "1/2/6/12",
                    "children": []
                }
            ]
        }
    ]
}{
    "id": 2,
    "name": "Folder A",
    "path": "1/2",
    "children": [
        {
            "id": 4,
            "name": "Folder A1",
            "path": "1/2/4",
            "children": [
                {
                    "id": 8,
                    "name": "Folder A1-1",
                    "path": "1/2/4/8",
                    "children": []
                },
                {
                    "id": 9,
                    "name": "Folder A1-2",
                    "path": "1/2/4/9",
                    "children": []
                },
                {
                    "id": 8,
                    "name": "Folder A1-1",
                    "path": "1/2/4/8",
                    "children": []
                },
                {
                    "id": 9,
                    "name": "Folder A1-2",
                    "path": "1/2/4/9",
                    "children": []
                }
            ]
        },
        {
            "id": 5,
            "name": "Folder A2",
            "path": "1/2/5",
            "children": [
                {
                    "id": 10,
                    "name": "Folder A2-1",
                    "path": "1/2/5/10",
                    "children": []
                },
                {
                    "id": 11,
                    "name": "Folder A2-2",
                    "path": "1/2/5/11",
                    "children": []
                },
                {
                    "id": 10,
                    "name": "Folder A2-1",
                    "path": "1/2/5/10",
                    "children": []
                },
                {
                    "id": 11,
                    "name": "Folder A2-2",
                    "path": "1/2/5/11",
                    "children": []
                }
            ]
        },
        {
            "id": 6,
            "name": "Folder A3",
            "path": "1/2/6",
            "children": [
                {
                    "id": 12,
                    "name": "Folder A3-1",
                    "path": "1/2/6/12",
                    "children": []
                },
                {
                    "id": 12,
                    "name": "Folder A3-1",
                    "path": "1/2/6/12",
                    "children": []
                }
            ]
        },
        {
            "id": 4,
            "name": "Folder A1",
            "path": "1/2/4",
            "children": [
                {
                    "id": 8,
                    "name": "Folder A1-1",
                    "path": "1/2/4/8",
                    "children": []
                },
                {
                    "id": 9,
                    "name": "Folder A1-2",
                    "path": "1/2/4/9",
                    "children": []
                },
                {
                    "id": 8,
                    "name": "Folder A1-1",
                    "path": "1/2/4/8",
                    "children": []
                },
                {
                    "id": 9,
                    "name": "Folder A1-2",
                    "path": "1/2/4/9",
                    "children": []
                }
            ]
        },
        {
            "id": 5,
            "name": "Folder A2",
            "path": "1/2/5",
            "children": [
                {
                    "id": 10,
                    "name": "Folder A2-1",
                    "path": "1/2/5/10",
                    "children": []
                },
                {
                    "id": 11,
                    "name": "Folder A2-2",
                    "path": "1/2/5/11",
                    "children": []
                },
                {
                    "id": 10,
                    "name": "Folder A2-1",
                    "path": "1/2/5/10",
                    "children": []
                },
                {
                    "id": 11,
                    "name": "Folder A2-2",
                    "path": "1/2/5/11",
                    "children": []
                }
            ]
        },
        {
            "id": 6,
            "name": "Folder A3",
            "path": "1/2/6",
            "children": [
                {
                    "id": 12,
                    "name": "Folder A3-1",
                    "path": "1/2/6/12",
                    "children": []
                },
                {
                    "id": 12,
                    "name": "Folder A3-1",
                    "path": "1/2/6/12",
                    "children": []
                }
            ]
        }
    ]
}
```
