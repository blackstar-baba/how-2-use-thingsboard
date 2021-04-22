do
$$
    declare
        deviceProfileName varchar(255);
        ruleChainName     varchar(255);
        dashboardTitle    varchar(255);
    BEGIN
        deviceProfileName := 'silo device profile';
        ruleChainName := 'Silo';
        dashboardTitle := 'Silos monitoring no banner';

        delete
        from relation
            where from_id in (
            select id
            from device
            where name in ('Silo A', 'Silo B', 'Silo C')
            );

        delete
        from attribute_kv
        where entity_id in (
            select id
            from device
            where name in ('Silo A', 'Silo B', 'Silo C', 'Silo Dispatcher')
        )
          and entity_type = 'DEVICE';

        delete
        from device_credentials
        where device_id in (
            select id
            from device
            where name in ('Silo A', 'Silo B', 'Silo C', 'Silo Dispatcher')
        );

        delete from device where name in ('Silo A', 'Silo B', 'Silo C', 'Silo Dispatcher');

        delete from device_profile where name = 'silo device profile';

        -- delete rule chain

        delete
        from relation
        where from_id in (
            select id
            from rule_node
            where rule_chain_id
                      in (select id from rule_chain where name = 'Silo')
        )
           or to_id in (
            select id
            from rule_node
            where rule_chain_id
                      in (select id from rule_chain where name = 'Silo')
        );

        delete
        from rule_node
        where rule_chain_id
                  in (select id from rule_chain where name = 'Silo');

        delete from rule_chain where name = 'Silo';

        -- delete dashboard

        delete from dashboard where title = 'Silos monitoring no banner';

    END
$$
