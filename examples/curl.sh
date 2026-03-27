#!/bin/bash

API_KEY="test_key_123"
BASE_URL="http://localhost:8080/v1"

echo "== Create Plan =="
curl -X POST $BASE_URL/plans \
  -H "x-api-key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"name":"pro","price":20000,"interval":"monthly"}'

echo "\n== Create Subscription =="
curl -X POST $BASE_URL/subscriptions \
  -H "x-api-key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"user_id":"user_123","plan_id":"plan_basic"}'

echo "\n== Check Entitlement =="
curl -H "x-api-key: $API_KEY" \
  $BASE_URL/entitlements/user_123