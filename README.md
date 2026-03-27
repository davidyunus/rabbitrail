# 🐇 RabbitRail

> 🚧 RabbitRail is currently in private beta
>
> A simple API to manage subscription access — without Stripe complexity.
>
> 👉 Request access: [daventodoor@gmail.com](mailto:daventodoor@gmail.com)

---

## 🚀 What is RabbitRail?

RabbitRail is a lightweight API for handling **subscription access & entitlements**.

Instead of building complex billing logic, RabbitRail answers one simple question:

> “Does this user have access?”

---

## ⚡ Quick Example

```bash
curl -H "x-api-key: YOUR_API_KEY" \
https://api.rabbitrail.io/v1/entitlements/user_123
```

### Response

```json
{
  "active": true,
  "plan_id": "plan_basic",
  "expires_at": "2026-04-26T22:12:22Z"
}
```

---

## 🧠 Core Concept

RabbitRail focuses on **entitlements**, not billing.

### Flow:

1. Create a plan
2. Create a subscription
3. Check entitlement

---

## 🔐 Authentication

All requests require an API key:

```http
x-api-key: YOUR_API_KEY
```

---

## 📦 Plans

### ➕ Create Plan

```http
POST /v1/plans
```

```json
{
  "name": "pro",
  "price": 20000,
  "interval": "monthly"
}
```

---

### 📄 List Plans

```http
GET /v1/plans
```

---

## 💳 Subscriptions

### ➕ Create Subscription

```http
POST /v1/subscriptions
```

```json
{
  "user_id": "user_123",
  "plan_id": "plan_basic"
}
```

---

### ❌ Invalid Plan

```json
{
  "error": "invalid plan"
}
```

---

## 🔑 Entitlements (CORE API)

### ✅ Check Access

```http
GET /v1/entitlements/{user_id}
```

### Example

```bash
curl -H "x-api-key: test_key_123" \
http://localhost:8080/v1/entitlements/user_123
```

---

### Response (Active)

```json
{
  "active": true,
  "plan_id": "plan_basic",
  "expires_at": "2026-04-26T22:12:22Z"
}
```

---

### Response (Inactive)

```json
{
  "active": false
}
```

---

## ⚠️ Errors

| Status | Description                |
| ------ | -------------------------- |
| 401    | Missing or invalid API key |
| 400    | Bad request                |
| 500    | Internal server error      |

---

## 💡 Example Flow

```bash
# 1. Create plan
POST /v1/plans

# 2. Create subscription
POST /v1/subscriptions

# 3. Check entitlement
GET /v1/entitlements/user_123
```

---

## 🛠️ Local Development

```bash
docker-compose up --build
```

---

## 🧭 Roadmap

* [ ] Expiry worker
* [ ] Cancel subscription
* [ ] Webhooks
* [ ] Billing integration

---

## 🚀 Why RabbitRail?

Stripe Billing is powerful—but often too complex.

RabbitRail gives you:

* Simple API
* Fast integration
* Focus on access control

---

## 📬 Get Access

RabbitRail is currently in private beta.

👉 Contact: [daventodoor@gmail.com](mailto:daventodoor@gmail.com)

---

## 🤝 Feedback

If you're building something with RabbitRail, I’d love to hear from you.
