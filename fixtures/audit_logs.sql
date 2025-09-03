SELECT
    concat('id_', toString(rand() % 1000000)) AS id,
    now() - rand() % (86400 * 30) AS timestamp,
    concat('tenant_', toString(rand() % 100)) AS tenant_id,
    concat('app_', toString(rand() % 500)) AS app_id,
    concat('product_', toString(rand() % 200)) AS product_slug,
    ['create', 'update', 'delete', 'login', 'logout', 'view', 'download', 'share', 'invite', 'approve'][rand() % 10 + 1] AS action,
    concat('user_', toString(rand() % 5000)) AS actor_id,
    ['user', 'admin', 'system', 'guest', 'service'][rand() % 5 + 1] AS actor_type,
    concat('User ', toString(rand() % 5000)) AS actor_name,
    concat('{"target_type": "', ['document', 'user', 'project', 'invoice', 'report'][rand() % 5 + 1], '", "target_id": "', toString(rand() % 10000), '"}') AS targets,
    concat(['User logged in', 'Document created', 'Project updated', 'Invoice approved', 'Report downloaded', 'User invited', 'Settings changed', 'Password reset', 'Account deactivated', 'Permission granted'][rand() % 10 + 1], ' at ', toString(now())) AS description,
    concat(toString(rand() % 256), '.', toString(rand() % 256), '.', toString(rand() % 256), '.', toString(rand() % 256)) AS ip_address,
    concat('Mozilla/5.0 (', ['Windows NT 10.0', 'Macintosh; Intel Mac OS X 10_15', 'X11; Linux x86_64', 'iPhone; CPU iPhone OS 14_0'][rand() % 4 + 1], ') ', ['Chrome/91.0.4472.124', 'Safari/537.36', 'Firefox/89.0', 'Edge/91.0.864.59'][rand() % 4 + 1]) AS user_agent,
    concat('{"browser": "', ['Chrome', 'Safari', 'Firefox', 'Edge'][rand() % 4 + 1], '", "os": "', ['Windows', 'MacOS', 'Linux', 'iOS', 'Android'][rand() % 5 + 1], '", "success": ', ['true', 'false'][rand() % 2 + 1], '}') AS meta_data
FROM numbers(1000)