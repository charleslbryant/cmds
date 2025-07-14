# API-XXXX: [API Name]

## Status
**Accepted** | Proposed | Deprecated | Superseded

## Overview
- **Version**: 1.0
- **Base URL**: `/api/v1/[resource]`
- **Authentication**: [Method used]
- **Format**: JSON

## Resource Model
```json
{
  "id": "string",
  "field1": "type",
  "field2": "type",
  "relationships": {
    "relatedResource": "type"
  }
}
```

## Endpoints

### List [Resources]
```
GET /api/v1/[resources]
```

**Query Parameters:**
- `page` (integer): Page number for pagination
- `limit` (integer): Items per page (default: 20, max: 100)
- `sort` (string): Sort field and order (e.g., "name:asc")
- `filter` (object): Filter criteria

**Response:**
```json
{
  "data": [
    {
      "id": "123",
      "field1": "value"
    }
  ],
  "meta": {
    "total": 100,
    "page": 1,
    "limit": 20
  }
}
```

### Get Single [Resource]
```
GET /api/v1/[resources]/{id}
```

**Response:**
```json
{
  "data": {
    "id": "123",
    "field1": "value"
  }
}
```

### Create [Resource]
```
POST /api/v1/[resources]
```

**Request Body:**
```json
{
  "field1": "value",
  "field2": "value"
}
```

**Response:** 
- Status: 201 Created
- Headers: Location: /api/v1/[resources]/{id}

### Update [Resource]
```
PUT /api/v1/[resources]/{id}
```

**Request Body:**
```json
{
  "field1": "updated value",
  "field2": "updated value"
}
```

### Partial Update [Resource]
```
PATCH /api/v1/[resources]/{id}
```

**Request Body:**
```json
{
  "field1": "updated value"
}
```

### Delete [Resource]
```
DELETE /api/v1/[resources]/{id}
```

**Response:** 
- Status: 204 No Content

## Error Responses

### Error Format
```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable message",
    "details": {
      "field": "Additional context"
    }
  }
}
```

### Common Error Codes
| Code | HTTP Status | Description |
|------|-------------|-------------|
| VALIDATION_ERROR | 400 | Invalid request data |
| UNAUTHORIZED | 401 | Authentication required |
| FORBIDDEN | 403 | Insufficient permissions |
| NOT_FOUND | 404 | Resource not found |
| CONFLICT | 409 | Resource conflict |
| RATE_LIMITED | 429 | Too many requests |
| SERVER_ERROR | 500 | Internal server error |

## Rate Limiting
- Rate limit: 1000 requests per hour
- Headers:
  - `X-RateLimit-Limit`: Total allowed requests
  - `X-RateLimit-Remaining`: Requests remaining
  - `X-RateLimit-Reset`: Unix timestamp for reset

## Versioning
- Version specified in URL path: `/api/v1/`
- Deprecation notice via `Sunset` header
- Minimum 6-month deprecation period

## Security
- HTTPS required
- Authentication via [method]
- Authorization checks for all operations
- Input validation and sanitization
- Output filtering based on permissions

## Performance Considerations
- Response time target: < 200ms (p95)
- Pagination for list endpoints
- Field selection via `fields` parameter
- Caching headers where appropriate

## Examples

### Example: Create a new resource
```bash
curl -X POST https://api.example.com/api/v1/resources \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "field1": "value",
    "field2": "value"
  }'
```

### Example: List with filters
```bash
curl "https://api.example.com/api/v1/resources?filter[status]=active&sort=created_at:desc&limit=10" \
  -H "Authorization: Bearer TOKEN"
```