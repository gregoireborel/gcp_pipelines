SESSION_SCHEMA = [
    {"name": "session_id", "type": "INTEGER", "mode": "REQUIRED"},
    {"name": "mpid", "type": "INTEGER", "mode": "REQUIRED"},
    {"name": "session_start_time", "type": "TIMESTAMP", "mode": "REQUIRED"},
    {"name": "session_end_time", "type": "TIMESTAMP", "mode": "NULLABLE"},
    {"name": "session_duration", "type": "INTEGER", "mode": "NULLABLE"},
    {"name": "ip", "type": "STRING", "mode": "REQUIRED"},
    {"name": "country_iso2", "type": "STRING", "mode": "NULLABLE"},
    {"name": "store_code", "type": "STRING", "mode": "NULLABLE"},
    {"name": "dispatch_id", "type": "STRING", "mode": "NULLABLE"},
    {"name": "variant_id", "type": "STRING", "mode": "NULLABLE"},
    {"name": "utm_campaign", "type": "STRING", "mode": "NULLABLE"},
    {"name": "utm_medium", "type": "STRING", "mode": "NULLABLE"},
    {"name": "utm_source", "type": "STRING", "mode": "NULLABLE"},
    {"name": "activity_platform", "type": "STRING", "mode": "REQUIRED"},
    {"name": "operating_system", "type": "STRING", "mode": "REQUIRED"},
    {"name": "update_date", "type": "TIMESTAMP", "mode": "REQUIRED"},
    {"name": "update_user", "type": "STRING", "mode": "REQUIRED"},
]

SESSION_ERROR_SCHEMA = [
    {"name": "session_id", "type": "INTEGER", "mode": "NULLABLE"},
    {"name": "mpid", "type": "INTEGER", "mode": "NULLABLE"},
    {"name": "session_start_time", "type": "TIMESTAMP", "mode": "NULLABLE"},
    {"name": "session_end_time", "type": "TIMESTAMP", "mode": "NULLABLE"},
    {"name": "session_duration", "type": "INTEGER", "mode": "NULLABLE"},
    {"name": "ip", "type": "STRING", "mode": "NULLABLE"},
    {"name": "country_iso2", "type": "STRING", "mode": "NULLABLE"},
    {"name": "store_code", "type": "STRING", "mode": "NULLABLE"},
    {"name": "dispatch_id", "type": "STRING", "mode": "NULLABLE"},
    {"name": "variant_id", "type": "STRING", "mode": "NULLABLE"},
    {"name": "utm_campaign", "type": "STRING", "mode": "NULLABLE"},
    {"name": "utm_medium", "type": "STRING", "mode": "NULLABLE"},
    {"name": "utm_source", "type": "STRING", "mode": "NULLABLE"},
    {"name": "activity_platform", "type": "STRING", "mode": "NULLABLE"},
    {"name": "operating_system", "type": "STRING", "mode": "NULLABLE"},
    {"name": "update_date", "type": "TIMESTAMP", "mode": "NULLABLE"},
    {"name": "update_user", "type": "STRING", "mode": "NULLABLE"},
]