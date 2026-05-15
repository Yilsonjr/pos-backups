--
-- PostgreSQL database dump
--

\restrict 75eCvcyNmdxjRnwb8GnXtkvn52lSICADhAqhSg9r80JM1cqCS8K81g25AP034JP

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.10 (Ubuntu 17.10-1.pgdg24.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: graphql(text, text, jsonb, jsonb); Type: FUNCTION; Schema: graphql_public; Owner: supabase_admin
--

CREATE FUNCTION graphql_public.graphql("operationName" text DEFAULT NULL::text, query text DEFAULT NULL::text, variables jsonb DEFAULT NULL::jsonb, extensions jsonb DEFAULT NULL::jsonb) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;


ALTER FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) OWNER TO supabase_admin;

--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: crear_venta_completa(jsonb, integer, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.crear_venta_completa(p_venta jsonb, p_usuario_id integer, p_negocio_id uuid) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_venta_id INT4;
    v_numero_factura TEXT;
    v_detalle JSONB;
    v_resultado JSONB;
BEGIN
    -- 1. Generar número de factura
    v_numero_factura := COALESCE(p_venta->>'numero_factura', 'FAC-' || to_char(now(), 'YYYYMMDD') || '-' || floor(random() * 10000)::text);

    -- 2. Insertar venta
    INSERT INTO public.ventas (
        negocio_id, usuario_id, cliente_id, numero_venta, 
        subtotal, descuento, impuestos, total, 
        metodo_pago, estado, caja_id
    ) VALUES (
        p_negocio_id, p_usuario_id, (p_venta->>'cliente_id')::INT4, v_numero_factura,
        (p_venta->>'subtotal')::NUMERIC, (p_venta->>'descuento')::NUMERIC, 
        COALESCE((p_venta->>'impuesto')::NUMERIC, (p_venta->>'impuestos')::NUMERIC, 0),
        (p_venta->>'total')::NUMERIC, (p_venta->>'metodo_pago')::TEXT, 'completada', 
        (p_venta->>'caja_id')::INT4
    )
    RETURNING id INTO v_venta_id;

    -- 3. Insertar detalles
    FOR v_detalle IN SELECT * FROM jsonb_array_elements(p_venta->'detalles')
    LOOP
        INSERT INTO public.ventas_detalle (
            negocio_id, venta_id, producto_id, producto_nombre, 
            cantidad, precio_unitario, descuento, subtotal
        ) VALUES (
            p_negocio_id, v_venta_id, (v_detalle->>'producto_id')::INT4, 
            (v_detalle->>'producto_nombre')::TEXT, (v_detalle->>'cantidad')::NUMERIC, 
            (v_detalle->>'precio_unitario')::NUMERIC, (v_detalle->>'descuento')::NUMERIC, 
            (v_detalle->>'subtotal')::NUMERIC
        );

        -- Stock
        UPDATE public.productos
        SET stock_actual = stock_actual - (v_detalle->>'cantidad')::NUMERIC
        WHERE id = (v_detalle->>'producto_id')::INT4 AND negocio_id = p_negocio_id;
    END LOOP;

    v_resultado := jsonb_build_object('id', v_venta_id, 'numero_venta', v_numero_factura);
    RETURN v_resultado;
END;
$$;


ALTER FUNCTION public.crear_venta_completa(p_venta jsonb, p_usuario_id integer, p_negocio_id uuid) OWNER TO postgres;

--
-- Name: validar_limite_cajas_plan(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validar_limite_cajas_plan() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_max_cajas INT;
  v_cajas_abiertas INT;
  v_plan_tipo TEXT;
BEGIN
  -- Solo validar al crear una caja en estado 'abierta'
  IF NEW.estado = 'abierta' THEN

    -- Si no viene negocio_id, no validamos (evita romper inserts legacy)
    IF NEW.negocio_id IS NULL THEN
      RETURN NEW;
    END IF;

    -- Obtener el plan del negocio
    SELECT COALESCE(plan_tipo, 'basico')
      INTO v_plan_tipo
    FROM public.negocios
    WHERE id = NEW.negocio_id;

    -- Mapear plan -> máximo de cajas abiertas simultáneas
    v_max_cajas := CASE LOWER(COALESCE(v_plan_tipo, 'basico'))
      WHEN 'basico'   THEN 1
      WHEN 'pro'      THEN 3
      WHEN 'premium'  THEN 10
      WHEN 'enterprise' THEN 999
      ELSE 1
    END;

    -- Contar cajas actualmente abiertas para este negocio
    SELECT COUNT(*) INTO v_cajas_abiertas
    FROM public.cajas
    WHERE negocio_id = NEW.negocio_id
      AND estado = 'abierta';

    -- Bloquear si excede el límite del plan
    IF v_cajas_abiertas >= v_max_cajas THEN
      RAISE EXCEPTION
        'Límite de suscripción excedido. El plan "%" solo permite % caja(s) abierta(s) simultáneamente.',
        v_plan_tipo, v_max_cajas;
    END IF;

  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.validar_limite_cajas_plan() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_
        -- Filter by action early - only get subscriptions interested in this action
        -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
        and (subs.action_filter = '*' or subs.action_filter = action::text);

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS TABLE(wal jsonb, is_rls_enabled boolean, subscription_ids uuid[], errors text[], slot_changes_count bigint)
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
  WITH pub AS (
    SELECT
      concat_ws(
        ',',
        CASE WHEN bool_or(pubinsert) THEN 'insert' ELSE NULL END,
        CASE WHEN bool_or(pubupdate) THEN 'update' ELSE NULL END,
        CASE WHEN bool_or(pubdelete) THEN 'delete' ELSE NULL END
      ) AS w2j_actions,
      coalesce(
        string_agg(
          realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
          ','
        ) filter (WHERE ppt.tablename IS NOT NULL AND ppt.tablename NOT LIKE '% %'),
        ''
      ) AS w2j_add_tables
    FROM pg_publication pp
    LEFT JOIN pg_publication_tables ppt ON pp.pubname = ppt.pubname
    WHERE pp.pubname = publication
    GROUP BY pp.pubname
    LIMIT 1
  ),
  -- MATERIALIZED ensures pg_logical_slot_get_changes is called exactly once
  w2j AS MATERIALIZED (
    SELECT x.*, pub.w2j_add_tables
    FROM pub,
         pg_logical_slot_get_changes(
           slot_name, null, max_changes,
           'include-pk', 'true',
           'include-transaction', 'false',
           'include-timestamp', 'true',
           'include-type-oids', 'true',
           'format-version', '2',
           'actions', pub.w2j_actions,
           'add-tables', pub.w2j_add_tables
         ) x
  ),
  -- Count raw slot entries before apply_rls/subscription filter
  slot_count AS (
    SELECT count(*)::bigint AS cnt
    FROM w2j
    WHERE w2j.w2j_add_tables <> ''
  ),
  -- Apply RLS and filter as before
  rls_filtered AS (
    SELECT xyz.wal, xyz.is_rls_enabled, xyz.subscription_ids, xyz.errors
    FROM w2j,
         realtime.apply_rls(
           wal := w2j.data::jsonb,
           max_record_bytes := max_record_bytes
         ) xyz(wal, is_rls_enabled, subscription_ids, errors)
    WHERE w2j.w2j_add_tables <> ''
      AND xyz.subscription_ids[1] IS NOT NULL
  )
  -- Real rows with slot count attached
  SELECT rf.wal, rf.is_rls_enabled, rf.subscription_ids, rf.errors, sc.cnt
  FROM rls_filtered rf, slot_count sc

  UNION ALL

  -- Sentinel row: always returned when no real rows exist so Elixir can
  -- always read slot_changes_count. Identified by wal IS NULL.
  SELECT null, null, null, null, sc.cnt
  FROM slot_count sc
  WHERE NOT EXISTS (SELECT 1 FROM rls_filtered)
$$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: allow_any_operation(text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_any_operation(expected_operations text[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT CASE
      WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
      ELSE raw_operation
    END AS current_operation
    FROM current_operation
  )
  SELECT EXISTS (
    SELECT 1
    FROM normalized n
    CROSS JOIN LATERAL unnest(expected_operations) AS expected_operation
    WHERE expected_operation IS NOT NULL
      AND expected_operation <> ''
      AND n.current_operation = CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END
  );
$$;


ALTER FUNCTION storage.allow_any_operation(expected_operations text[]) OWNER TO supabase_storage_admin;

--
-- Name: allow_only_operation(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_only_operation(expected_operation text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT
      CASE
        WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
        ELSE raw_operation
      END AS current_operation,
      CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END AS requested_operation
    FROM current_operation
  )
  SELECT CASE
    WHEN requested_operation IS NULL OR requested_operation = '' THEN FALSE
    ELSE COALESCE(current_operation = requested_operation, FALSE)
  END
  FROM normalized;
$$;


ALTER FUNCTION storage.allow_only_operation(expected_operation text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Get the last path segment (the actual filename)
    SELECT _parts[array_length(_parts, 1)] INTO _filename;
    -- Extract extension: reverse, split on '.', then reverse again
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


ALTER FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint)::bigint as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.protect_delete() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


ALTER TABLE auth.custom_oauth_providers OWNER TO supabase_auth_admin;

--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: webauthn_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_challenges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    challenge_type text NOT NULL,
    session_data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    CONSTRAINT webauthn_challenges_challenge_type_check CHECK ((challenge_type = ANY (ARRAY['signup'::text, 'registration'::text, 'authentication'::text])))
);


ALTER TABLE auth.webauthn_challenges OWNER TO supabase_auth_admin;

--
-- Name: webauthn_credentials; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_credentials (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    credential_id bytea NOT NULL,
    public_key bytea NOT NULL,
    attestation_type text DEFAULT ''::text NOT NULL,
    aaguid uuid,
    sign_count bigint DEFAULT 0 NOT NULL,
    transports jsonb DEFAULT '[]'::jsonb NOT NULL,
    backup_eligible boolean DEFAULT false NOT NULL,
    backed_up boolean DEFAULT false NOT NULL,
    friendly_name text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone
);


ALTER TABLE auth.webauthn_credentials OWNER TO supabase_auth_admin;

--
-- Name: arqueos_caja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arqueos_caja (
    id bigint NOT NULL,
    caja_id bigint,
    billetes_2000 integer DEFAULT 0,
    billetes_1000 integer DEFAULT 0,
    billetes_500 integer DEFAULT 0,
    billetes_200 integer DEFAULT 0,
    billetes_100 integer DEFAULT 0,
    billetes_50 integer DEFAULT 0,
    monedas_25 integer DEFAULT 0,
    monedas_10 integer DEFAULT 0,
    monedas_5 integer DEFAULT 0,
    monedas_1 integer DEFAULT 0,
    total_billetes numeric DEFAULT 0,
    total_monedas numeric DEFAULT 0,
    total_contado numeric DEFAULT 0,
    total_esperado numeric DEFAULT 0,
    diferencia numeric DEFAULT 0,
    notas text,
    created_at timestamp with time zone DEFAULT now(),
    negocio_id uuid
);


ALTER TABLE public.arqueos_caja OWNER TO postgres;

--
-- Name: arqueos_caja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.arqueos_caja ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.arqueos_caja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cajas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cajas (
    id bigint NOT NULL,
    monto_inicial numeric NOT NULL,
    monto_final numeric,
    monto_esperado numeric,
    diferencia numeric,
    estado text DEFAULT 'abierta'::text,
    usuario_apertura text NOT NULL,
    fecha_apertura timestamp with time zone DEFAULT now(),
    fecha_cierre timestamp with time zone,
    notas_apertura text,
    notas_cierre text,
    total_ventas_efectivo numeric DEFAULT 0,
    total_ventas_tarjeta numeric DEFAULT 0,
    total_entradas numeric DEFAULT 0,
    total_salidas numeric DEFAULT 0,
    monto_real numeric DEFAULT 0,
    usuario_cierre text,
    updated_at timestamp with time zone DEFAULT now(),
    negocio_id uuid,
    CONSTRAINT cajas_estado_check CHECK ((estado = ANY (ARRAY['abierta'::text, 'cerrada'::text])))
);


ALTER TABLE public.cajas OWNER TO postgres;

--
-- Name: cajas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cajas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cajas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id bigint NOT NULL,
    nombre text NOT NULL,
    descripcion text,
    color text DEFAULT '#2563eb'::text,
    activo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categorias ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id bigint NOT NULL,
    nombre text NOT NULL,
    rnc text,
    email text,
    telefono text,
    direccion text,
    limite_credito numeric DEFAULT 0,
    balance_pendiente numeric DEFAULT 0,
    activo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    cedula text,
    tipo_cliente text DEFAULT 'regular'::text,
    descuento_porcentaje numeric DEFAULT 0,
    updated_at timestamp with time zone DEFAULT now(),
    negocio_id uuid
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.clientes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: compras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras (
    id bigint NOT NULL,
    proveedor_id bigint,
    usuario_id bigint,
    numero_compra text NOT NULL,
    fecha_compra timestamp with time zone DEFAULT now(),
    fecha_vencimiento date,
    subtotal numeric NOT NULL,
    impuestos numeric DEFAULT 0,
    descuento numeric DEFAULT 0,
    total numeric NOT NULL,
    metodo_pago text NOT NULL,
    estado text DEFAULT 'completada'::text,
    notas text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    negocio_id uuid,
    CONSTRAINT compras_estado_check CHECK ((estado = ANY (ARRAY['completada'::text, 'cancelada'::text, 'pendiente'::text])))
);


ALTER TABLE public.compras OWNER TO postgres;

--
-- Name: compras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.compras ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.compras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: configuracion_fiscal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuracion_fiscal (
    id integer DEFAULT 1 NOT NULL,
    modo_fiscal boolean DEFAULT false,
    rnc_empresa text,
    nombre_empresa text,
    alerta_ncf_limite integer DEFAULT 50,
    created_at timestamp with time zone DEFAULT now(),
    negocio_id uuid
);


ALTER TABLE public.configuracion_fiscal OWNER TO postgres;

--
-- Name: cuentas_pagar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas_pagar (
    id bigint NOT NULL,
    proveedor_id bigint,
    concepto text NOT NULL,
    monto_total numeric NOT NULL,
    monto_pagado numeric DEFAULT 0,
    monto_pendiente numeric NOT NULL,
    fecha_factura date DEFAULT CURRENT_DATE,
    fecha_vencimiento date,
    prioridad text DEFAULT 'media'::text,
    categoria text,
    numero_factura text,
    estado text DEFAULT 'pendiente'::text,
    notas text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    negocio_id uuid,
    CONSTRAINT cuentas_pagar_estado_check CHECK ((estado = ANY (ARRAY['pendiente'::text, 'parcial'::text, 'pagada'::text, 'vencida'::text])))
);


ALTER TABLE public.cuentas_pagar OWNER TO postgres;

--
-- Name: cuentas_pagar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cuentas_pagar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cuentas_pagar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cuentas_por_cobrar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas_por_cobrar (
    id bigint NOT NULL,
    cliente_id bigint,
    venta_id bigint,
    concepto text NOT NULL,
    monto_total numeric NOT NULL,
    monto_pagado numeric DEFAULT 0,
    monto_pendiente numeric NOT NULL,
    fecha_venta date DEFAULT CURRENT_DATE,
    fecha_vencimiento date,
    estado text DEFAULT 'pendiente'::text,
    notas text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    negocio_id uuid,
    CONSTRAINT cuentas_por_cobrar_estado_check CHECK ((estado = ANY (ARRAY['pendiente'::text, 'parcial'::text, 'pagada'::text, 'vencida'::text])))
);


ALTER TABLE public.cuentas_por_cobrar OWNER TO postgres;

--
-- Name: cuentas_por_cobrar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cuentas_por_cobrar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cuentas_por_cobrar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: detalles_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalles_compra (
    id bigint NOT NULL,
    compra_id bigint,
    producto_id bigint,
    cantidad integer NOT NULL,
    precio_unitario numeric NOT NULL,
    subtotal numeric NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    negocio_id uuid,
    CONSTRAINT detalles_compra_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE public.detalles_compra OWNER TO postgres;

--
-- Name: detalles_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.detalles_compra ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.detalles_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mesas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mesas (
    id bigint NOT NULL,
    numero text NOT NULL,
    estado text DEFAULT 'disponible'::text,
    area text DEFAULT 'General'::text,
    created_at timestamp with time zone DEFAULT now(),
    negocio_id uuid,
    CONSTRAINT mesas_estado_check CHECK ((estado = ANY (ARRAY['disponible'::text, 'ocupada'::text, 'mantenimiento'::text])))
);


ALTER TABLE public.mesas OWNER TO postgres;

--
-- Name: mesas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.mesas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.mesas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: movimientos_caja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimientos_caja (
    id bigint NOT NULL,
    caja_id bigint,
    tipo text NOT NULL,
    concepto text NOT NULL,
    monto numeric NOT NULL,
    referencia text,
    usuario_id bigint,
    created_at timestamp with time zone DEFAULT now(),
    negocio_id uuid,
    CONSTRAINT movimientos_caja_tipo_check CHECK ((tipo = ANY (ARRAY['entrada'::text, 'salida'::text, 'venta'::text])))
);


ALTER TABLE public.movimientos_caja OWNER TO postgres;

--
-- Name: movimientos_caja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.movimientos_caja ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.movimientos_caja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: negocios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.negocios (
    id uuid NOT NULL,
    nombre text DEFAULT 'LogosPOS'::text NOT NULL,
    rnc text,
    telefono text,
    direccion text,
    lema text,
    logo_url text,
    email text,
    web text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    subdominio text,
    plan_tipo text DEFAULT 'basico'::text,
    estado_licencia text DEFAULT 'activa'::text,
    tipo_negocio text DEFAULT 'general'::text,
    modulos_activos jsonb DEFAULT '["ventas", "inventario", "caja", "clientes", "reportes", "usuarios"]'::jsonb,
    fecha_vencimiento timestamp with time zone
);


ALTER TABLE public.negocios OWNER TO postgres;

--
-- Name: pagos_cuentas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos_cuentas (
    id bigint NOT NULL,
    cuenta_id bigint,
    monto numeric NOT NULL,
    fecha_pago timestamp with time zone DEFAULT now(),
    metodo_pago text NOT NULL,
    referencia text,
    notas text,
    created_at timestamp with time zone DEFAULT now(),
    negocio_id uuid
);


ALTER TABLE public.pagos_cuentas OWNER TO postgres;

--
-- Name: pagos_cuentas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pagos_cuentas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pagos_cuentas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pagos_cuentas_pagar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos_cuentas_pagar (
    id bigint NOT NULL,
    cuenta_id bigint,
    monto numeric NOT NULL,
    fecha_pago timestamp with time zone DEFAULT now(),
    metodo_pago text NOT NULL,
    referencia text,
    notas text,
    created_at timestamp with time zone DEFAULT now(),
    negocio_id uuid
);


ALTER TABLE public.pagos_cuentas_pagar OWNER TO postgres;

--
-- Name: pagos_cuentas_pagar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pagos_cuentas_pagar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pagos_cuentas_pagar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pedidos_mesa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_mesa (
    id bigint NOT NULL,
    mesa_id bigint,
    usuario_id bigint,
    cliente_id bigint,
    estado text DEFAULT 'abierto'::text,
    total numeric DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    nombre_cliente text,
    negocio_id uuid,
    CONSTRAINT pedidos_mesa_estado_check CHECK ((estado = ANY (ARRAY['abierto'::text, 'finalizado'::text, 'cancelado'::text])))
);


ALTER TABLE public.pedidos_mesa OWNER TO postgres;

--
-- Name: pedidos_mesa_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_mesa_detalle (
    id bigint NOT NULL,
    pedido_id bigint,
    producto_id bigint,
    producto_nombre text NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric NOT NULL,
    subtotal numeric NOT NULL,
    estado_pago text DEFAULT 'pendiente'::text,
    created_at timestamp with time zone DEFAULT now(),
    notas text,
    estado_preparacion text DEFAULT 'solicitado'::text,
    negocio_id uuid,
    CONSTRAINT pedidos_mesa_detalle_cantidad_check CHECK ((cantidad > 0)),
    CONSTRAINT pedidos_mesa_detalle_estado_pago_check CHECK ((estado_pago = ANY (ARRAY['pendiente'::text, 'pagado'::text]))),
    CONSTRAINT pedidos_mesa_detalle_estado_preparacion_check CHECK ((estado_preparacion = ANY (ARRAY['solicitado'::text, 'en_cocina'::text, 'listo'::text, 'entregado'::text])))
);


ALTER TABLE public.pedidos_mesa_detalle OWNER TO postgres;

--
-- Name: pedidos_mesa_detalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pedidos_mesa_detalle ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pedidos_mesa_detalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pedidos_mesa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pedidos_mesa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pedidos_mesa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id bigint NOT NULL,
    nombre text NOT NULL,
    descripcion text,
    precio_compra numeric DEFAULT 0,
    precio_venta numeric DEFAULT 0,
    stock_actual integer DEFAULT 0,
    stock_minimo integer DEFAULT 5,
    categoria_id bigint,
    codigo_barras text,
    sku text,
    imagen_url text,
    activo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    unidad text DEFAULT 'Unidad'::text,
    imagen_nombre text,
    updated_at timestamp with time zone DEFAULT now(),
    unidad_medida text DEFAULT 'Unidad'::text,
    negocio_id uuid
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.productos ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id bigint NOT NULL,
    nombre text NOT NULL,
    documento text,
    telefono text,
    email text,
    direccion text,
    contacto text,
    activo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    tipo_documento text DEFAULT 'RNC'::text,
    ciudad text,
    pais text DEFAULT 'República Dominicana'::text,
    negocio_id uuid
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.proveedores ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.proveedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    nombre text NOT NULL,
    descripcion text,
    permisos jsonb DEFAULT '[]'::jsonb,
    activo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    color text DEFAULT '#3b82f6'::text,
    negocio_id uuid
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: secuencias_ncf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.secuencias_ncf (
    id bigint NOT NULL,
    tipo_ncf text NOT NULL,
    serie text DEFAULT 'B'::text,
    secuencia_inicio integer NOT NULL,
    secuencia_fin integer NOT NULL,
    secuencia_actual integer NOT NULL,
    fecha_vencimiento date,
    activo boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    negocio_id uuid
);


ALTER TABLE public.secuencias_ncf OWNER TO postgres;

--
-- Name: secuencias_ncf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.secuencias_ncf ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.secuencias_ncf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sesiones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sesiones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sesiones_id_seq OWNER TO postgres;

--
-- Name: sesiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sesiones (
    id bigint DEFAULT nextval('public.sesiones_id_seq'::regclass) NOT NULL,
    usuario_id bigint,
    token text NOT NULL,
    fecha_inicio timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion timestamp with time zone NOT NULL,
    ip_address text,
    user_agent text,
    activa boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sesiones OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    email text,
    username text NOT NULL,
    password text NOT NULL,
    rol_id bigint,
    activo boolean DEFAULT true,
    ultimo_acceso timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    telefono text,
    negocio_id uuid
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.usuarios ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    id bigint NOT NULL,
    numero_venta text NOT NULL,
    cliente_id bigint,
    usuario_id bigint,
    caja_id bigint,
    subtotal numeric NOT NULL,
    descuento numeric DEFAULT 0,
    impuestos numeric DEFAULT 0,
    total numeric NOT NULL,
    metodo_pago text,
    tipo_venta text,
    estado text DEFAULT 'completada'::text,
    ncf text,
    tipo_ncf text,
    rnc_cliente text,
    nombre_cliente_fiscal text,
    created_at timestamp with time zone DEFAULT now(),
    mesa_id bigint,
    pedido_id bigint,
    updated_at timestamp with time zone DEFAULT now(),
    notas text,
    fecha timestamp with time zone DEFAULT now(),
    negocio_id uuid,
    CONSTRAINT ventas_metodo_pago_check CHECK ((metodo_pago = ANY (ARRAY['efectivo'::text, 'tarjeta'::text, 'credito'::text, 'mixto'::text]))),
    CONSTRAINT ventas_tipo_venta_check CHECK ((tipo_venta = ANY (ARRAY['contado'::text, 'credito'::text])))
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- Name: ventas_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas_detalle (
    id bigint NOT NULL,
    venta_id bigint,
    producto_id bigint,
    producto_nombre text NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric NOT NULL,
    descuento numeric DEFAULT 0,
    subtotal numeric NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    negocio_id uuid,
    notas text
);


ALTER TABLE public.ventas_detalle OWNER TO postgres;

--
-- Name: ventas_detalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ventas_detalle ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ventas_detalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ventas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ventas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2026_05_11; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_05_11 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_05_11 OWNER TO supabase_admin;

--
-- Name: messages_2026_05_12; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_05_12 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_05_12 OWNER TO supabase_admin;

--
-- Name: messages_2026_05_13; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_05_13 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_05_13 OWNER TO supabase_admin;

--
-- Name: messages_2026_05_14; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_05_14 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_05_14 OWNER TO supabase_admin;

--
-- Name: messages_2026_05_15; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_05_15 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_05_15 OWNER TO supabase_admin;

--
-- Name: messages_2026_05_16; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_05_16 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_05_16 OWNER TO supabase_admin;

--
-- Name: messages_2026_05_17; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_05_17 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_05_17 OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb,
    metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: messages_2026_05_11; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_05_11 FOR VALUES FROM ('2026-05-11 00:00:00') TO ('2026-05-12 00:00:00');


--
-- Name: messages_2026_05_12; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_05_12 FOR VALUES FROM ('2026-05-12 00:00:00') TO ('2026-05-13 00:00:00');


--
-- Name: messages_2026_05_13; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_05_13 FOR VALUES FROM ('2026-05-13 00:00:00') TO ('2026-05-14 00:00:00');


--
-- Name: messages_2026_05_14; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_05_14 FOR VALUES FROM ('2026-05-14 00:00:00') TO ('2026-05-15 00:00:00');


--
-- Name: messages_2026_05_15; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_05_15 FOR VALUES FROM ('2026-05-15 00:00:00') TO ('2026-05-16 00:00:00');


--
-- Name: messages_2026_05_16; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_05_16 FOR VALUES FROM ('2026-05-16 00:00:00') TO ('2026-05-17 00:00:00');


--
-- Name: messages_2026_05_17; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_05_17 FOR VALUES FROM ('2026-05-17 00:00:00') TO ('2026-05-18 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
20260302000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- Data for Name: arqueos_caja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arqueos_caja (id, caja_id, billetes_2000, billetes_1000, billetes_500, billetes_200, billetes_100, billetes_50, monedas_25, monedas_10, monedas_5, monedas_1, total_billetes, total_monedas, total_contado, total_esperado, diferencia, notas, created_at, negocio_id) FROM stdin;
1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	700	0	\N	2026-02-24 20:29:14.363576+00	\N
2	3	0	0	0	0	0	0	0	0	0	0	0	0	2100	2100	0	\N	2026-02-24 21:00:57.751716+00	\N
3	2	0	0	0	0	0	0	0	0	0	0	0	0	0	900	0	\N	2026-02-24 21:09:39.773638+00	\N
4	4	0	0	0	0	0	0	0	0	0	0	0	0	0	500	0	\N	2026-02-24 21:20:15.5029+00	\N
5	5	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-02-24 23:20:35.134313+00	\N
6	6	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-02-25 18:17:53.532023+00	\N
7	7	0	0	0	0	0	0	0	0	0	0	0	0	0	500	0	\N	2026-02-25 22:16:35.309457+00	\N
8	9	0	0	0	0	0	0	0	0	0	0	0	0	0	500	0	\N	2026-02-26 00:26:20.481153+00	\N
9	8	0	0	0	0	0	0	0	0	0	0	0	0	0	500	0	\N	2026-02-26 00:29:06.37241+00	\N
10	12	0	0	0	0	0	0	0	0	0	0	0	0	0	500	0	\N	2026-03-02 21:11:51.799879+00	\N
11	10	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-03 11:19:12.459231+00	\N
12	13	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-03 11:20:38.649615+00	\N
13	11	0	0	0	0	0	0	0	0	0	0	0	0	0	500	0	\N	2026-03-05 00:27:08.803723+00	\N
14	14	0	0	0	0	0	0	0	0	0	0	0	0	1500	1500	0	\N	2026-03-05 00:30:24.756787+00	\N
15	15	0	0	0	0	0	0	0	0	0	0	0	0	0	500	0	\N	2026-03-05 14:18:55.136753+00	\N
16	17	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-19 00:32:55.981596+00	\N
17	18	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-26 20:11:45.734554+00	\N
18	19	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-26 20:20:58.102674+00	\N
19	16	0	0	0	0	0	0	0	0	0	0	0	0	0	499	0	\N	2026-03-26 21:30:50.420198+00	\N
20	21	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-26 21:46:08.599522+00	\N
21	20	0	0	0	0	0	0	0	0	0	0	0	0	1500	1500	0	\N	2026-03-26 21:49:27.586028+00	\N
22	22	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-27 01:33:51.085183+00	\N
23	23	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-27 11:17:52.271685+00	\N
24	23	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-27 11:17:53.25544+00	\N
25	25	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-27 14:14:31.454627+00	\N
26	26	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-27 14:18:11.348486+00	\N
27	27	0	0	0	0	0	0	0	0	0	0	0	0	0	176	0	\N	2026-03-27 14:29:34.594133+00	\N
28	24	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-27 17:20:26.397771+00	\N
29	28	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-27 17:28:15.099688+00	\N
30	29	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-27 18:41:10.015307+00	\N
31	30	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-27 21:16:38.605759+00	\N
32	31	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-27 22:35:28.123248+00	\N
33	32	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-03-28 12:29:55.887608+00	\N
34	33	0	0	0	0	0	0	0	0	0	0	0	0	0	200	0	\N	2026-03-28 20:06:04.791271+00	\N
35	34	0	0	0	0	0	0	0	0	0	0	0	0	100	100	0	\N	2026-03-28 20:18:29.959354+00	\N
36	35	0	0	0	0	0	0	0	0	0	0	0	0	0	1000	0	\N	2026-03-28 20:32:15.343586+00	\N
37	36	8	1	3	1	4	6	0	0	0	0	19400	0	19550	19550	0	\N	2026-03-29 05:10:27.180367+00	\N
38	37	0	0	0	0	0	0	0	0	0	0	0	0	0	26425	0	\N	2026-03-30 20:39:04.440615+00	\N
39	38	1	4	5	1	8	1	0	0	0	0	9550	0	9550	9550	0	\N	2026-03-31 02:54:31.33718+00	\N
40	39	0	0	0	0	0	0	0	0	0	0	0	0	0	12750	0	\N	2026-04-01 04:22:58.542674+00	\N
41	40	1	8	10	3	0	0	30	0	0	0	15600	750	16350	16350	0	\N	2026-04-02 04:04:59.013998+00	\N
42	41	3	12	6	2	8	\N	30	1	4	0	22200	780	22980	22980	0	\N	2026-04-03 03:35:58.243046+00	\N
43	42	0	0	0	0	0	0	0	0	0	0	0	0	0	7050	0	\N	2026-04-04 20:57:34.128204+00	\N
44	43	5	18	16	5	4	12	30	7	4	0	38000	840	38840	38840	0	\N	2026-04-05 05:50:56.460178+00	\N
45	44	0	2	4	1	2	2	26	9	5	0	4500	765	5265	5265	0	\N	2026-04-06 02:45:27.003557+00	\N
46	45	0	4	5	5	11	4	26	9	5	0	8800	765	9565	9565	0	\N	2026-04-07 03:47:37.907276+00	\N
47	46	0	0	0	0	0	0	0	0	0	0	0	0	0	6405	0	\N	2026-04-09 03:53:06.212878+00	\N
48	47	1	3	4	1	10	17	16	8	4	0	9050	500	9550	9550	0	\N	2026-04-10 03:03:37.544857+00	\N
49	48	4	1	5	0	0	5	21	11	8	0	11750	675	12425	12425	0	\N	2026-04-11 04:00:36.524121+00	\N
50	49	3	6	4	2	3	0	13	11	9	0	14700	480	15180	15180	0	\N	2026-04-12 00:49:30.894496+00	\N
51	50	9	7	0	0	16	1	6	9	9	0	26650	285	26935	26935	0	\N	2026-04-13 03:36:55.942755+00	\N
52	51	1	5	2	0	12	5	6	9	9	0	9450	285	9735	9735	0	\N	2026-04-15 03:44:40.381877+00	\N
53	52	0	0	0	0	0	0	0	0	0	0	0	0	0	7400	0	\N	2026-04-16 03:35:04.183273+00	\N
54	53	0	0	0	0	0	0	0	0	0	0	0	0	0	7600	0	\N	2026-04-17 03:27:09.814761+00	\N
55	54	0	0	0	0	0	0	0	0	0	0	0	0	0	9975	0	\N	2026-04-18 03:46:29.103403+00	\N
56	55	0	0	0	0	0	0	0	0	0	0	0	0	0	9150	0	\N	2026-04-19 03:38:01.903963+00	\N
57	56	0	0	0	0	0	0	0	0	0	0	0	0	0	7650	0	\N	2026-04-20 03:15:00.704506+00	\N
58	57	0	0	0	0	0	0	0	0	0	0	0	0	5000	5000	0	\N	2026-04-20 19:40:32.694674+00	\N
59	58	0	0	0	0	0	0	0	0	0	0	0	0	0	6500	0	\N	2026-04-21 03:44:42.914962+00	\N
60	59	0	0	0	0	0	0	0	0	0	0	0	0	0	5000	0	\N	2026-04-21 20:35:46.36211+00	\N
61	60	0	0	0	0	0	0	0	0	0	0	0	0	0	7710	0	\N	2026-04-22 03:44:41.531907+00	\N
62	62	0	0	0	0	0	0	0	0	0	0	0	0	0	485	0	\N	2026-04-23 03:33:14.26361+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
63	63	0	0	0	0	0	0	0	0	0	0	0	0	0	100	0	\N	2026-04-23 03:36:09.166492+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
65	64	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-04-23 12:46:26.650461+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
64	64	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-04-23 12:46:26.660668+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
66	64	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	\N	2026-04-23 12:46:26.808996+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
67	61	0	0	0	0	0	0	0	0	0	0	0	0	0	5000	0	\N	2026-04-24 02:41:51.010218+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
68	65	0	0	0	0	0	0	0	0	0	0	0	0	0	5000	0	\N	2026-04-24 02:44:18.094295+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
69	66	0	0	0	0	0	0	0	0	0	0	0	0	31	31	0	\N	2026-04-24 16:47:57.219204+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
70	67	0	0	0	0	0	0	0	0	0	0	0	0	0	12775	0	\N	2026-04-25 04:28:59.574018+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
71	68	0	0	0	0	0	0	0	0	0	0	0	0	0	13680	0	\N	2026-04-26 03:36:55.513623+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
72	69	0	0	0	0	0	0	0	0	0	0	0	0	0	6850	0	\N	2026-04-27 02:47:21.531606+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
73	70	0	0	0	0	0	0	0	0	0	0	0	0	0	6865	0	\N	2026-04-28 02:50:47.484938+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
74	71	0	0	0	0	0	0	0	0	0	0	0	0	0	7350	0	\N	2026-04-29 03:33:24.902473+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
75	73	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	\N	2026-04-30 11:31:29.214784+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
76	72	0	0	0	0	0	0	0	0	0	0	0	0	0	8350	0	\N	2026-05-01 03:18:53.127595+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
77	74	0	0	0	0	0	0	0	0	0	0	0	0	0	12225	0	\N	2026-05-02 04:20:57.412174+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
78	75	0	0	0	0	0	0	0	0	0	0	0	0	0	12655	0	\N	2026-05-03 04:30:03.290136+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
79	76	0	0	0	0	0	0	0	0	0	0	0	0	0	7800	0	\N	2026-05-04 03:58:48.831558+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
80	77	0	0	0	0	0	0	0	0	0	0	0	0	0	5200	0	\N	2026-05-05 02:27:00.036408+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
81	78	0	0	0	0	0	0	0	0	0	0	0	0	0	1604	0	\N	2026-05-06 02:57:30.836454+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
82	79	0	0	0	0	0	0	0	0	0	0	0	0	0	8600	0	\N	2026-05-09 03:29:45.570635+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
83	80	0	0	0	0	0	0	0	0	0	0	0	0	0	6850	0	\N	2026-05-11 03:50:51.176876+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
84	81	0	0	0	0	0	0	0	0	0	0	0	0	0	6600	0	\N	2026-05-12 03:20:22.097665+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
85	82	0	0	0	0	0	0	0	0	0	0	0	0	0	9850	0	\N	2026-05-13 03:49:29.26571+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
86	105	0	0	0	0	0	0	0	0	0	0	0	0	1	1	0	\N	2026-05-13 22:01:00.370128+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
87	105	0	0	0	0	0	0	0	0	0	0	0	0	1	1	0	\N	2026-05-13 22:01:01.006025+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
88	106	0	0	0	0	0	0	0	0	0	0	0	0	0	5400	0	\N	2026-05-14 03:06:01.771173+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
\.


--
-- Data for Name: cajas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cajas (id, monto_inicial, monto_final, monto_esperado, diferencia, estado, usuario_apertura, fecha_apertura, fecha_cierre, notas_apertura, notas_cierre, total_ventas_efectivo, total_ventas_tarjeta, total_entradas, total_salidas, monto_real, usuario_cierre, updated_at, negocio_id) FROM stdin;
65	5000	0	5000	0	cerrada	caja	2026-04-24 02:43:13.014+00	2026-04-24 02:43:55.822+00		\N	0	0	0	0	0	admin	2026-04-24 02:43:35.556501+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
67	5265	0	12775	0	cerrada	caja	2026-04-24 20:29:47.88+00	2026-04-25 04:28:36.05+00		\N	7510	0	0	0	0	admin	2026-04-24 20:30:12.557936+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
69	5000	0	6850	0	cerrada	caja	2026-04-26 20:11:28.217+00	2026-04-27 02:46:55.93+00		\N	1850	0	0	0	0	admin	2026-04-26 20:11:54.444756+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
71	5000	0	7350	0	cerrada	caja	2026-04-28 20:19:05.825+00	2026-04-29 03:32:57.554+00		\N	2350	0	0	0	0	admin	2026-04-28 20:19:33.713941+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
72	5000	0	8350	0	cerrada	caja	2026-04-29 22:26:41.754+00	2026-05-01 03:18:23.126+00		\N	3350	0	0	0	0	admin	2026-04-29 22:27:10.682393+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
75	5000	0	12655	0	cerrada	caja	2026-05-02 23:33:37.481+00	2026-05-03 04:29:31.824+00		\N	7655	0	0	0	0	admin	2026-05-02 23:34:09.647861+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
77	5000	0	5200	0	cerrada	caja	2026-05-04 17:11:44.415+00	2026-05-05 02:26:59.752+00		\N	200	0	0	0	0	admin	2026-05-04 17:11:45.408117+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
79	5000	0	8600	0	cerrada	caja	2026-05-06 20:17:21.364+00	2026-05-09 03:29:43.113+00		\N	3600	0	0	0	0	admin	2026-05-06 20:17:22.098749+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
81	5000	0	6600	0	cerrada	caja	2026-05-11 19:57:16.038+00	2026-05-12 03:20:22.492+00		\N	1600	0	0	0	0	admin	2026-05-11 19:57:16.325298+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
104	500	\N	\N	\N	abierta	AdminDev	2026-05-13 21:56:02.429+00	\N		\N	0	0	0	0	0	\N	2026-05-13 21:56:04.188498+00	00000000-0000-0000-0000-000000000000
106	5000	0	5400	0	cerrada	caja	2026-05-14 01:47:29.928+00	2026-05-14 03:05:59.248+00		\N	400	0	0	0	0	admin	2026-05-14 01:47:32.763625+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
1	500	0	700	0	cerrada	admin	2026-02-24 17:16:05.304+00	2026-02-24 20:29:14.688+00		\N	200	0	0	0	0	admin	2026-02-24 17:16:05.366077+00	11111111-1111-1111-1111-111111111111
3	1500	2100	2100	0	cerrada	abel	2026-02-24 20:56:06.088+00	2026-02-24 21:00:13.089+00		\N	600	0	0	0	2100	admin	2026-02-24 20:56:50.998439+00	11111111-1111-1111-1111-111111111111
2	500	0	900	0	cerrada	caja	2026-02-24 20:05:30.308+00	2026-02-24 21:09:40.115+00		\N	400	0	0	0	0	admin	2026-02-24 20:05:30.191877+00	11111111-1111-1111-1111-111111111111
4	500	0	500	0	cerrada	caja	2026-02-24 21:10:18.643+00	2026-02-24 21:19:30.875+00		\N	0	0	0	0	0	admin	2026-02-24 21:11:03.514973+00	11111111-1111-1111-1111-111111111111
5	1	0	1	0	cerrada	admin	2026-02-24 23:19:51.028+00	2026-02-24 23:20:35.057+00		\N	0	0	0	0	0	admin	2026-02-24 23:19:51.357753+00	11111111-1111-1111-1111-111111111111
6	1	0	1	0	cerrada	admin	2026-02-25 00:05:02.269+00	2026-02-25 18:17:53.606+00		\N	0	0	0	0	0	admin	2026-02-25 00:05:02.55301+00	11111111-1111-1111-1111-111111111111
7	500	0	500	0	cerrada	admin	2026-02-25 18:19:58.095+00	2026-02-25 22:15:50.571+00		\N	0	0	0	0	0	admin	2026-02-25 18:19:58.245882+00	11111111-1111-1111-1111-111111111111
9	500	0	500	0	cerrada	admin	2026-02-25 22:32:53.064+00	2026-02-26 00:25:35.804+00		\N	0	0	0	0	0	admin	2026-02-25 22:33:38.004098+00	11111111-1111-1111-1111-111111111111
8	500	0	500	0	cerrada	abel	2026-02-25 22:08:35.766+00	2026-02-26 00:29:06.431+00		\N	0	0	0	0	0	admin	2026-02-25 22:09:20.698902+00	11111111-1111-1111-1111-111111111111
12	500	0	500	0	cerrada	Cristofer	2026-03-02 21:11:06.13+00	2026-03-02 21:11:51.866+00		\N	0	0	0	0	0	admin	2026-03-02 21:11:06.278755+00	11111111-1111-1111-1111-111111111111
10	1	0	1	0	cerrada	admin	2026-02-26 15:52:28.346+00	2026-03-03 11:19:13.385+00		\N	0	0	0	0	0	admin	2026-02-26 15:52:27.05305+00	11111111-1111-1111-1111-111111111111
13	1	0	1	0	cerrada	admin	2026-03-03 11:19:37.896+00	2026-03-03 11:20:39.564+00		\N	0	0	0	0	0	admin	2026-03-03 11:19:37.195074+00	11111111-1111-1111-1111-111111111111
11	500	0	500	0	cerrada	caja	2026-02-26 22:49:01.158+00	2026-03-05 00:26:21.242+00		\N	0	0	0	0	0	admin	2026-02-26 22:49:47.263047+00	11111111-1111-1111-1111-111111111111
14	1500	1500	1500	0	cerrada	caja	2026-03-05 00:26:44.719+00	2026-03-05 00:29:37.2+00		\N	0	0	0	0	1500	admin	2026-03-05 00:27:32.515531+00	11111111-1111-1111-1111-111111111111
15	500	0	500	0	cerrada	caja	2026-03-05 14:17:51.521+00	2026-03-05 14:18:07.327+00		\N	0	0	0	0	0	admin	2026-03-05 14:18:39.528928+00	11111111-1111-1111-1111-111111111111
17	1	0	1	0	cerrada	admin	2026-03-19 00:31:57.141+00	2026-03-19 00:32:56.409+00		\N	0	0	0	0	0	admin	2026-03-19 00:31:56.977486+00	11111111-1111-1111-1111-111111111111
18	1	0	1	0	cerrada	admin	2026-03-26 19:58:07.89+00	2026-03-26 20:11:46.202+00		\N	0	0	0	0	0	admin	2026-03-26 19:58:07.637009+00	11111111-1111-1111-1111-111111111111
19	1	0	1	0	cerrada	admin	2026-03-26 20:20:48.339+00	2026-03-26 20:20:58.574+00		\N	0	0	0	0	0	admin	2026-03-26 20:20:48.066837+00	11111111-1111-1111-1111-111111111111
16	499	0	499	0	cerrada	caja	2026-03-05 14:21:25.095+00	2026-03-26 21:29:56.609+00		\N	0	0	0	0	0	admin	2026-03-05 14:22:13.082271+00	11111111-1111-1111-1111-111111111111
21	1	0	1	0	cerrada	admin	2026-03-26 21:44:42.413+00	2026-03-26 21:46:09.172+00		\N	0	0	0	0	0	admin	2026-03-26 21:44:42.181725+00	11111111-1111-1111-1111-111111111111
20	1500	1500	1500	0	cerrada	caja	2026-03-26 21:30:52.096+00	2026-03-26 21:48:33.792+00		\N	0	0	0	0	1500	admin	2026-03-26 21:31:46.127837+00	11111111-1111-1111-1111-111111111111
22	1	0	1	0	cerrada	admin	2026-03-27 01:33:21.454+00	2026-03-27 01:33:51.143+00		\N	0	0	0	0	0	admin	2026-03-27 01:33:21.6257+00	11111111-1111-1111-1111-111111111111
33	200	0	200	0	cerrada	admin	2026-03-28 20:05:46.282+00	2026-03-28 20:06:03.926+00		\N	0	0	0	0	0	admin	2026-03-28 20:05:47.391905+00	11111111-1111-1111-1111-111111111111
23	1	0	1	0	cerrada	admin	2026-03-27 11:17:30.055+00	2026-03-27 11:17:53.335+00		\N	0	0	0	0	0	admin	2026-03-27 11:17:30.23475+00	11111111-1111-1111-1111-111111111111
25	1	0	1	0	cerrada	caja	2026-03-27 14:06:30.235+00	2026-03-27 14:13:36.716+00		\N	0	0	0	0	0	admin	2026-03-27 14:07:25.190061+00	11111111-1111-1111-1111-111111111111
26	1	0	1	0	cerrada	caja	2026-03-27 14:14:41.207+00	2026-03-27 14:17:16.609+00		\N	0	0	0	0	0	admin	2026-03-27 14:15:36.116978+00	11111111-1111-1111-1111-111111111111
27	1	0	176	0	cerrada	caja	2026-03-27 14:18:02.883+00	2026-03-27 14:28:39.864+00		\N	175	0	0	0	0	admin	2026-03-27 14:18:57.826584+00	11111111-1111-1111-1111-111111111111
24	1	0	1	0	cerrada	admin	2026-03-27 13:15:11.185+00	2026-03-27 17:20:26.866+00		\N	0	0	0	0	0	admin	2026-03-27 13:15:11.45211+00	11111111-1111-1111-1111-111111111111
28	1	0	1	0	cerrada	admin	2026-03-27 17:28:03.787+00	2026-03-27 17:28:15.568+00		\N	0	0	0	0	0	admin	2026-03-27 17:28:03.555494+00	11111111-1111-1111-1111-111111111111
29	1	0	1	0	cerrada	admin	2026-03-27 18:40:58.423+00	2026-03-27 18:41:10.102+00		\N	0	0	0	0	0	admin	2026-03-27 18:40:58.529178+00	11111111-1111-1111-1111-111111111111
30	1	0	1	0	cerrada	admin	2026-03-27 21:16:27.916+00	2026-03-27 21:16:39.086+00		\N	0	0	0	0	0	admin	2026-03-27 21:16:27.642705+00	11111111-1111-1111-1111-111111111111
31	1	0	1	0	cerrada	admin	2026-03-27 22:34:59.86+00	2026-03-27 22:35:29.091+00		\N	0	0	0	0	0	admin	2026-03-27 22:34:59.101685+00	11111111-1111-1111-1111-111111111111
32	1	0	1	0	cerrada	admin	2026-03-28 12:29:41.049+00	2026-03-28 12:29:56.806+00		\N	0	0	0	0	0	admin	2026-03-28 12:29:40.348098+00	11111111-1111-1111-1111-111111111111
34	100	100	100	0	cerrada	admin	2026-03-28 20:17:59.683+00	2026-03-28 20:18:29.109+00		\N	0	0	0	0	100	admin	2026-03-28 20:18:00.751446+00	11111111-1111-1111-1111-111111111111
35	1000	0	1000	0	cerrada	caja	2026-03-28 20:18:51.953+00	2026-03-28 20:31:19.297+00		\N	0	0	0	0	0	admin	2026-03-28 20:19:48.34458+00	11111111-1111-1111-1111-111111111111
36	2000	19550	19550	0	cerrada	caja	2026-03-28 20:32:31.85+00	2026-03-29 05:10:27.69+00		\N	17550	0	0	0	19550	admin	2026-03-28 20:33:28.103677+00	11111111-1111-1111-1111-111111111111
37	3500	0	26425	0	cerrada	caja	2026-03-29 19:26:31.631+00	2026-03-30 20:39:02.367+00		\N	17925	0	5000	0	0	admin	2026-03-29 19:26:33.08159+00	11111111-1111-1111-1111-111111111111
38	5000	9550	9550	0	cerrada	caja	2026-03-30 20:39:28.83+00	2026-03-31 02:54:29.506+00		\N	4550	0	0	0	9550	admin	2026-03-30 20:39:31.135245+00	11111111-1111-1111-1111-111111111111
39	3000	0	12750	0	cerrada	caja	2026-03-31 20:41:33.729+00	2026-04-01 04:22:56.235+00		\N	9750	0	0	0	0	admin	2026-03-31 20:41:37.204359+00	11111111-1111-1111-1111-111111111111
40	2550	16350	16350	0	cerrada	caja	2026-04-01 20:55:29.032+00	2026-04-02 04:04:55.072+00		\N	13800	0	0	0	16350	admin	2026-04-01 20:55:34.900615+00	11111111-1111-1111-1111-111111111111
41	6000	22980	22980	0	cerrada	caja	2026-04-02 21:08:25.402+00	2026-04-03 03:35:56.399+00		\N	16980	0	0	0	22980	admin	2026-04-02 21:08:28.442831+00	11111111-1111-1111-1111-111111111111
42	6500	0	7050	0	cerrada	caja	2026-04-04 19:21:54.221+00	2026-04-04 20:57:31.035+00		\N	1400	0	0	850	0	admin	2026-04-04 19:21:58.322714+00	11111111-1111-1111-1111-111111111111
43	6525	38840	38840	0	cerrada	caja	2026-04-04 21:08:16.54+00	2026-04-05 05:50:52.937+00		\N	32315	0	0	0	38840	admin	2026-04-04 21:08:21.17421+00	11111111-1111-1111-1111-111111111111
44	2050	5265	5265	0	cerrada	caja	2026-04-05 23:33:54.754+00	2026-04-06 02:45:22.178+00		\N	3215	0	0	0	5265	admin	2026-04-05 23:34:00.865888+00	11111111-1111-1111-1111-111111111111
45	5515	9565	9565	0	cerrada	caja	2026-04-06 21:00:47.052+00	2026-04-07 03:47:32.92+00		\N	4050	0	0	0	9565	admin	2026-04-06 21:00:53.538175+00	11111111-1111-1111-1111-111111111111
46	755	0	6405	0	cerrada	caja	2026-04-08 21:28:34.486+00	2026-04-09 03:53:00.247+00		\N	5650	0	0	0	0	admin	2026-04-08 21:28:40.958465+00	11111111-1111-1111-1111-111111111111
47	4000	9550	9550	0	cerrada	caja	2026-04-09 21:13:13.735+00	2026-04-10 03:03:30.267+00		\N	5550	0	0	0	9550	admin	2026-04-09 21:13:22.241175+00	11111111-1111-1111-1111-111111111111
48	5300	12425	12425	0	cerrada	caja	2026-04-10 21:12:05.431+00	2026-04-11 04:00:27.674+00		\N	7125	0	0	0	12425	admin	2026-04-10 21:12:14.959975+00	11111111-1111-1111-1111-111111111111
49	5000	15180	15180	0	cerrada	caja	2026-04-11 20:32:40.472+00	2026-04-12 00:49:21.125+00		\N	10180	0	0	0	15180	admin	2026-04-11 20:32:51.395059+00	11111111-1111-1111-1111-111111111111
50	5000	26935	26935	0	cerrada	caja	2026-04-12 20:22:58.706+00	2026-04-13 03:36:45.964+00		\N	21935	0	0	0	26935	admin	2026-04-12 20:23:09.61111+00	11111111-1111-1111-1111-111111111111
51	3735	9735	9735	0	cerrada	caja	2026-04-13 21:16:46.413+00	2026-04-15 03:44:27.578+00		\N	6000	0	0	0	9735	admin	2026-04-13 21:16:58.801312+00	11111111-1111-1111-1111-111111111111
52	5000	0	7400	0	cerrada	caja	2026-04-15 20:59:15.656+00	2026-04-16 03:34:50.418+00		\N	2400	0	0	0	0	admin	2026-04-15 20:59:29.877275+00	11111111-1111-1111-1111-111111111111
53	5000	0	7600	0	cerrada	caja	2026-04-16 20:14:17.56+00	2026-04-17 03:26:55.341+00		\N	2600	0	0	0	0	admin	2026-04-16 20:14:32.77838+00	11111111-1111-1111-1111-111111111111
54	5000	0	9975	0	cerrada	caja	2026-04-17 19:52:39.497+00	2026-04-18 03:46:13.842+00		\N	4975	0	0	0	0	admin	2026-04-17 19:52:55.399747+00	11111111-1111-1111-1111-111111111111
55	5000	0	9150	0	cerrada	caja	2026-04-18 20:01:31.638+00	2026-04-19 03:37:45.18+00		\N	4150	0	0	0	0	admin	2026-04-18 20:01:49.03671+00	11111111-1111-1111-1111-111111111111
56	5000	0	7650	0	cerrada	caja	2026-04-19 19:15:44.832+00	2026-04-20 03:14:42.644+00		\N	2650	0	0	0	0	admin	2026-04-19 19:16:03.507523+00	11111111-1111-1111-1111-111111111111
57	5000	5000	5000	0	cerrada	caja	2026-04-20 19:15:35.031+00	2026-04-20 19:40:32.561+00		\N	0	0	0	0	5000	admin	2026-04-20 19:15:54.674685+00	11111111-1111-1111-1111-111111111111
58	5000	0	6500	0	cerrada	caja	2026-04-20 23:02:36.915+00	2026-04-21 03:44:23.806+00		\N	1500	0	0	0	0	admin	2026-04-20 23:02:56.477007+00	11111111-1111-1111-1111-111111111111
59	5000	0	5000	0	cerrada	caja	2026-04-21 03:48:09.401+00	2026-04-21 20:35:26.026+00		\N	0	0	0	0	0	admin	2026-04-21 03:48:29.128163+00	11111111-1111-1111-1111-111111111111
60	1260	0	7710	0	cerrada	caja	2026-04-21 20:36:21.262+00	2026-04-22 03:44:21.49+00		\N	6450	0	0	0	0	admin	2026-04-21 20:36:41.86546+00	\N
62	500	0	485	0	cerrada	admin	2026-04-23 02:55:02.651+00	2026-04-23 03:33:13.475+00		\N	0	0	0	15	0	admin	2026-04-23 02:55:04.320269+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
63	100	0	100	0	cerrada	admin	2026-04-23 03:33:50.3+00	2026-04-23 03:36:08.423+00	Apertura de ejemplo	\N	15	0	0	15	0	admin	2026-04-23 03:33:51.292148+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
66	1	31	31	0	cerrada	admin	2026-04-24 16:44:23.728+00	2026-04-24 16:47:57.42+00		\N	30	0	0	0	31	admin	2026-04-24 16:44:23.879244+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
68	5265	0	13680	0	cerrada	caja	2026-04-25 20:41:07.361+00	2026-04-26 03:36:31.107+00		\N	8415	0	0	0	0	admin	2026-04-25 20:41:32.370026+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
64	1	0	1	0	cerrada	admin	2026-04-23 12:35:26.607+00	2026-04-23 12:46:27.842+00		\N	0	0	0	0	0	admin	2026-04-23 12:35:25.835149+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
61	5000	0	5000	0	cerrada	caja	2026-04-22 20:29:30.784+00	2026-04-24 02:41:28.761+00		\N	0	0	0	0	0	admin	2026-04-22 20:29:52.967326+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
70	5000	0	6865	0	cerrada	caja	2026-04-27 19:40:39.487+00	2026-04-28 02:50:20.633+00		\N	1865	0	0	0	0	admin	2026-04-27 19:41:06.940649+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
73	1	0	0	0	cerrada	admin	2026-04-30 11:30:36.542+00	2026-04-30 11:31:29.23+00		\N	0	0	0	1	0	admin	2026-04-30 11:30:36.813585+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
74	5000	0	12225	0	cerrada	caja	2026-05-01 20:35:14.741+00	2026-05-02 04:20:26.484+00		\N	7225	0	0	0	0	admin	2026-05-01 20:35:46.296457+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
76	5000	0	7800	0	cerrada	caja	2026-05-03 21:43:22.053+00	2026-05-04 03:58:48.986+00		\N	2800	0	0	0	0	admin	2026-05-03 21:43:55.108483+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
78	4	0	1604	0	cerrada	caja	2026-05-05 23:27:08.35+00	2026-05-06 02:57:31.516+00		\N	1600	0	0	0	0	admin	2026-05-05 23:27:09.131452+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
80	5000	0	6850	0	cerrada	caja	2026-05-09 20:15:06.89+00	2026-05-11 03:50:51.269+00		\N	1850	0	0	0	0	admin	2026-05-09 20:15:10.780578+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
82	5000	0	9850	0	cerrada	caja	2026-05-12 19:25:40.085+00	2026-05-13 03:49:28.238+00		\N	4850	0	0	0	0	admin	2026-05-12 19:25:42.032806+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
105	1	1	1	0	cerrada	admin	2026-05-13 21:56:45.527+00	2026-05-13 22:01:01.114+00		\N	0	0	0	0	1	admin	2026-05-13 21:56:45.644902+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
\.


--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, nombre, descripcion, color, activo, created_at) FROM stdin;
3	Canelilla	fireball/ king pride	#10b981	t	2026-02-24 17:09:15.154232+00
1	Cerveza 	Presidente, Corona. etc	#7c3aed	t	2026-02-24 17:09:15.154232+00
7	whisky	etiqueta negra, gold, old pad	#6b7280	t	2026-02-24 17:09:15.154232+00
5	Ron	brugal, y otra marcas	#dc2626	t	2026-02-24 17:09:15.154232+00
6	Vodka	\N	#0284c7	t	2026-02-24 17:09:15.154232+00
4	Vino	Pan, pasteles y repostería	#d97706	t	2026-02-24 17:09:15.154232+00
8	Mezcladores	\N	#6b7280	t	2026-02-26 15:49:45.697092+00
2	Tequila	Aperitivos y snacks	#f59e0b	t	2026-02-24 17:09:15.154232+00
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nombre, rnc, email, telefono, direccion, limite_credito, balance_pendiente, activo, created_at, cedula, tipo_cliente, descuento_porcentaje, updated_at, negocio_id) FROM stdin;
1	Cliente General	\N	\N	\N	\N	0	0	t	2026-02-24 17:09:15.154232+00	\N	regular	0	2026-02-24 17:09:15.154232+00	11111111-1111-1111-1111-111111111111
2	Elier arismendy		elekr@gmail.com	8095040176		5000	1000	t	2026-02-25 18:19:05.123556+00	40221570399	vip	0	2026-02-25 18:19:05.123556+00	11111111-1111-1111-1111-111111111111
\.


--
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras (id, proveedor_id, usuario_id, numero_compra, fecha_compra, fecha_vencimiento, subtotal, impuestos, descuento, total, metodo_pago, estado, notas, created_at, updated_at, negocio_id) FROM stdin;
\.


--
-- Data for Name: configuracion_fiscal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuracion_fiscal (id, modo_fiscal, rnc_empresa, nombre_empresa, alerta_ncf_limite, created_at, negocio_id) FROM stdin;
1	f	\N	\N	50	2026-02-24 17:04:18.134495+00	6b0df693-1c18-412d-bce1-f719d922f92d
\.


--
-- Data for Name: cuentas_pagar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas_pagar (id, proveedor_id, concepto, monto_total, monto_pagado, monto_pendiente, fecha_factura, fecha_vencimiento, prioridad, categoria, numero_factura, estado, notas, created_at, updated_at, negocio_id) FROM stdin;
\.


--
-- Data for Name: cuentas_por_cobrar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas_por_cobrar (id, cliente_id, venta_id, concepto, monto_total, monto_pagado, monto_pendiente, fecha_venta, fecha_vencimiento, estado, notas, created_at, updated_at, negocio_id) FROM stdin;
6	2	10	Venta a crédito - Factura FAC-20260225-8153	400	400	0	2026-02-25	2026-03-27	pagada	Venta a crédito - Factura FAC-20260225-8153	2026-02-25 21:01:08.956173+00	2026-02-25 21:28:03.513+00	\N
5	2	9	Venta a crédito - Factura FAC-20260225-2549	200	200	0	2026-02-25	2026-03-27	pagada	Venta a crédito - Factura FAC-20260225-2549	2026-02-25 20:59:23.585622+00	2026-02-25 21:33:02.187+00	\N
8	2	12	Venta a crédito - Factura FAC-20260225-8999	200	200	0	2026-02-25	2026-03-27	pagada	Venta a crédito - Factura FAC-20260225-8999	2026-02-25 22:14:15.693111+00	2026-02-25 22:14:12.85+00	\N
\.


--
-- Data for Name: detalles_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalles_compra (id, compra_id, producto_id, cantidad, precio_unitario, subtotal, created_at, negocio_id) FROM stdin;
\.


--
-- Data for Name: mesas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mesas (id, numero, estado, area, created_at, negocio_id) FROM stdin;
6	mesa 3	disponible		2026-03-26 21:42:51.270326+00	11111111-1111-1111-1111-111111111111
5	barra 3	disponible		2026-03-26 21:42:27.313502+00	11111111-1111-1111-1111-111111111111
1	Mesa 1	disponible	Esquina Derecha	2026-02-24 17:24:52.524126+00	11111111-1111-1111-1111-111111111111
2	mesa 2	disponible	Ezquina Izquierda	2026-02-24 20:22:11.684451+00	11111111-1111-1111-1111-111111111111
3	1	disponible	barra	2026-03-26 21:41:18.293414+00	11111111-1111-1111-1111-111111111111
12	billard 1	disponible		2026-03-26 21:43:45.332596+00	11111111-1111-1111-1111-111111111111
11	mesa 8	disponible		2026-03-26 21:43:38.043522+00	11111111-1111-1111-1111-111111111111
4	barra 2	disponible		2026-03-26 21:42:03.546889+00	11111111-1111-1111-1111-111111111111
13	billar 2	disponible		2026-03-26 21:44:03.577658+00	11111111-1111-1111-1111-111111111111
7	mesa 4	disponible		2026-03-26 21:42:58.517405+00	11111111-1111-1111-1111-111111111111
8	mesa 5	disponible		2026-03-26 21:43:06.443431+00	11111111-1111-1111-1111-111111111111
10	mesa 7	disponible		2026-03-26 21:43:31.925487+00	11111111-1111-1111-1111-111111111111
9	mesa 6	disponible		2026-03-26 21:43:13.498194+00	11111111-1111-1111-1111-111111111111
\.


--
-- Data for Name: movimientos_caja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimientos_caja (id, caja_id, tipo, concepto, monto, referencia, usuario_id, created_at, negocio_id) FROM stdin;
629	60	venta	Venta FAC-20260421-3562 (Efectivo)	800	632	3	2026-04-21 22:07:35.022387+00	\N
641	60	venta	Venta FAC-20260421-9314 (Efectivo)	200	644	3	2026-04-22 03:44:20.264875+00	\N
652	67	venta	Venta FAC-20260425-1055 (Efectivo)	200	666	3	2026-04-25 01:43:52.042406+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
662	68	venta	Venta FAC-20260425-22 (Efectivo)	200	676	3	2026-04-25 20:41:44.384091+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
672	68	venta	Venta FAC-20260426-2619 (Efectivo)	1625	686	3	2026-04-26 02:42:33.325357+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
682	69	venta	Venta FAC-20260426-8720 (Efectivo)	200	696	3	2026-04-26 23:50:56.532006+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
692	72	venta	Venta FAC-20260501-6584 (Efectivo)	200	705	3	2026-05-01 00:31:28.779292+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
703	74	venta	Venta FAC-20260502-8580 (Efectivo)	400	716	3	2026-05-02 02:32:43.590463+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
715	75	venta	Venta FAC-20260503-9236 (Efectivo)	500	728	3	2026-05-03 03:24:49.063681+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
725	76	venta	Venta FAC-20260503-406 (Efectivo)	400	738	3	2026-05-03 21:56:23.535293+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
736	78	venta	Venta FAC-20260505-7062 (Efectivo)	200	749	3	2026-05-05 23:45:05.879835+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
750	82	venta	Venta FAC-20260513-8627 (Efectivo)	1050	763	3	2026-05-13 01:05:23.644956+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
630	60	venta	Venta FAC-20260421-0905 (Efectivo)	600	633	3	2026-04-21 22:29:52.479142+00	\N
642	62	salida	Cancelación Venta FAC-20260423-9318 (Efectivo)	15	649	2	2026-04-23 03:22:40.321696+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
653	67	venta	Venta FAC-20260425-8755 (Efectivo)	150	667	3	2026-04-25 01:45:19.854173+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
663	68	venta	Venta FAC-20260425-6650 (Efectivo)	200	677	3	2026-04-25 21:06:43.835334+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
673	68	venta	Venta FAC-20260426-8615 (Efectivo)	150	687	3	2026-04-26 02:50:32.060493+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
683	70	venta	Venta FAC-20260427-9054 (Efectivo)	1000	697	3	2026-04-27 22:39:21.920779+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
693	72	venta	Venta FAC-20260501-3348 (Efectivo)	800	706	3	2026-05-01 00:42:30.24413+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
704	74	venta	Venta FAC-20260502-2616 (Efectivo)	400	717	3	2026-05-02 02:46:18.29515+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
705	74	venta	Venta FAC-20260502-1665 (Efectivo)	900	718	3	2026-05-02 02:47:11.787894+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
716	75	venta	Venta FAC-20260503-7294 (Efectivo)	600	729	3	2026-05-03 03:27:24.3011+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
726	76	venta	Venta FAC-20260503-3157 (Efectivo)	475	739	3	2026-05-03 21:58:18.829704+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
737	78	venta	Venta FAC-20260506-4777 (Efectivo)	200	750	3	2026-05-06 00:15:13.333219+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
738	78	venta	Venta FAC-20260506-7755 (Efectivo)	200	751	3	2026-05-06 00:15:13.701231+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
751	82	venta	Venta FAC-20260513-486 (Efectivo)	1100	764	3	2026-05-13 01:08:09.273168+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
631	60	venta	Venta FAC-20260421-6650 (Efectivo)	350	634	3	2026-04-22 00:34:39.06481+00	\N
643	63	venta	Venta FAC-20260423-5408 (Efectivo)	15	651	2	2026-04-23 03:34:05.09343+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
654	67	venta	Venta FAC-20260425-3615 (Efectivo)	150	668	3	2026-04-25 02:08:49.255357+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
664	68	venta	Venta FAC-20260425-9788 (Efectivo)	400	678	3	2026-04-25 21:34:36.509723+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
674	68	venta	Venta FAC-20260426-5357 (Efectivo)	600	688	3	2026-04-26 03:32:45.064838+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
684	70	venta	Venta FAC-20260427-98 (Efectivo)	200	698	3	2026-04-27 23:20:16.252492+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
694	72	venta	Venta FAC-20260501-624 (Efectivo)	150	707	3	2026-05-01 01:46:55.667238+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
695	72	venta	Venta FAC-20260501-5432 (Efectivo)	800	708	3	2026-05-01 01:47:16.575959+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
706	74	venta	Venta FAC-20260502-8640 (Efectivo)	600	719	3	2026-05-02 02:57:02.039173+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
707	74	venta	Venta FAC-20260502-9737 (Efectivo)	200	720	3	2026-05-02 02:57:57.018826+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
717	75	venta	Venta FAC-20260503-8234 (Efectivo)	1000	730	3	2026-05-03 03:45:43.29577+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
727	76	venta	Venta FAC-20260503-7457 (Efectivo)	475	740	3	2026-05-03 21:58:20.048011+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
739	79	venta	Venta FAC-20260506-7915 (Efectivo)	600	752	3	2026-05-06 23:16:52.505186+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
740	79	venta	Venta FAC-20260506-3779 (Efectivo)	400	753	3	2026-05-06 23:17:39.064013+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
752	82	venta	Venta FAC-20260513-2180 (Efectivo)	1900	765	3	2026-05-13 01:43:45.096951+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
632	60	venta	Venta FAC-20260421-0407 (Efectivo)	200	635	3	2026-04-22 01:14:21.760672+00	\N
644	63	salida	Cancelación Venta FAC-20260423-5408 (Efectivo)	15	651	2	2026-04-23 03:35:39.972361+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
655	67	venta	Venta FAC-20260425-2156 (Efectivo)	400	669	3	2026-04-25 02:29:54.402037+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
665	68	venta	Venta FAC-20260425-5751 (Efectivo)	200	679	3	2026-04-25 21:51:04.542275+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
675	68	venta	Venta FAC-20260426-6002 (Efectivo)	300	689	3	2026-04-26 03:33:31.065244+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
685	70	venta	Venta FAC-20260428-5691 (Efectivo)	200	699	3	2026-04-28 00:10:44.054222+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
696	72	venta	Venta FAC-20260501-8600 (Efectivo)	600	709	3	2026-05-01 01:49:37.399939+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
708	74	venta	Venta FAC-20260502-7401 (Efectivo)	600	721	3	2026-05-02 04:20:27.48167+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
718	75	venta	Venta FAC-20260503-8763 (Efectivo)	50	731	3	2026-05-03 03:46:33.071554+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
728	76	venta	Venta FAC-20260503-1405 (Efectivo)	500	741	3	2026-05-03 21:59:29.028949+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
741	79	venta	Venta FAC-20260507-6542 (Efectivo)	800	754	3	2026-05-07 02:34:56.588139+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
742	79	venta	Venta FAC-20260507-9760 (Efectivo)	800	755	3	2026-05-07 02:36:33.722311+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
753	82	venta	Venta FAC-20260513-6783 (Efectivo)	800	766	3	2026-05-13 03:46:49.001493+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
633	60	venta	Venta FAC-20260421-2379 (Efectivo)	300	636	3	2026-04-22 01:31:54.25759+00	\N
634	60	venta	Venta FAC-20260421-4542 (Efectivo)	300	637	3	2026-04-22 01:31:55.630047+00	\N
645	66	venta	Venta FAC-20260424-2471 (Efectivo)	15	661	2	2026-04-24 16:45:51.037239+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
656	67	venta	Venta FAC-20260425-5166 (Efectivo)	150	670	3	2026-04-25 02:38:07.623269+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
666	68	venta	Venta FAC-20260425-9845 (Efectivo)	200	680	3	2026-04-25 21:51:04.52535+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
676	68	venta	Venta FAC-20260426-2880 (Efectivo)	575	690	3	2026-04-26 03:35:51.176116+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
686	70	venta	Venta FAC-20260428-2615 (Efectivo)	450	700	3	2026-04-28 00:11:20.705332+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
697	74	venta	Venta FAC-20260501-7506 (Efectivo)	525	710	3	2026-05-01 20:42:55.638209+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
709	75	venta	Venta FAC-20260502-2640 (Efectivo)	400	722	3	2026-05-02 23:34:25.709361+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
719	75	venta	Venta FAC-20260503-1692 (Efectivo)	475	732	3	2026-05-03 03:50:08.009078+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
729	76	venta	Venta FAC-20260503-7307 (Efectivo)	200	742	3	2026-05-03 22:30:13.323423+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
743	79	venta	Venta FAC-20260507-8511 (Efectivo)	400	756	3	2026-05-07 03:41:22.358284+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
754	106	venta	Venta FAC-20260514-9565 (Efectivo)	400	767	3	2026-05-14 01:49:29.05395+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
635	60	venta	Venta FAC-20260421-5032 (Efectivo)	400	638	3	2026-04-22 01:43:56.425249+00	\N
646	66	venta	Venta FAC-20260424-9921 (Efectivo)	15	662	2	2026-04-24 16:45:51.686659+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
657	67	venta	Venta FAC-20260425-6876 (Efectivo)	2100	671	3	2026-04-25 02:41:49.93901+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
667	68	venta	Venta FAC-20260425-4917 (Efectivo)	1215	681	3	2026-04-25 23:30:27.82468+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
677	69	venta	Venta FAC-20260426-2929 (Efectivo)	200	691	3	2026-04-26 21:39:56.716854+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
687	70	venta	Venta FAC-20260428-2676 (Efectivo)	15	701	3	2026-04-28 01:36:59.890867+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
698	74	venta	Venta FAC-20260501-3390 (Efectivo)	400	711	3	2026-05-01 22:11:05.538422+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
710	75	venta	Venta FAC-20260502-7989 (Efectivo)	30	723	3	2026-05-02 23:35:37.183896+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
720	75	venta	Venta FAC-20260503-3736 (Efectivo)	150	733	3	2026-05-03 03:50:46.239944+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
730	76	venta	Venta FAC-20260504-7152 (Efectivo)	150	743	3	2026-05-04 00:47:05.148891+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
744	79	venta	Venta FAC-20260509-2139 (Efectivo)	600	757	3	2026-05-09 03:29:16.482794+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
636	60	venta	Venta FAC-20260421-8903 (Efectivo)	300	639	3	2026-04-22 01:51:20.278442+00	\N
647	66	salida	Cancelación Venta FAC-20260424-9921 (Efectivo)	15	662	2	2026-04-24 16:49:02.611195+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
648	66	salida	Cancelación Venta FAC-20260424-2471 (Efectivo)	15	661	2	2026-04-24 16:49:09.179156+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
658	67	venta	Venta FAC-20260425-7983 (Efectivo)	150	672	3	2026-04-25 03:14:53.303275+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
668	68	venta	Venta FAC-20260426-8819 (Efectivo)	200	682	3	2026-04-26 01:58:58.527072+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
678	69	venta	Venta FAC-20260426-8715 (Efectivo)	900	692	3	2026-04-26 22:53:06.959903+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
688	71	venta	Venta FAC-20260429-2409 (Efectivo)	1200	702	3	2026-04-29 00:08:21.955413+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
699	74	venta	Venta FAC-20260501-3252 (Efectivo)	950	712	3	2026-05-01 23:17:38.091918+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
711	75	venta	Venta FAC-20260503-6232 (Efectivo)	800	724	3	2026-05-03 01:25:32.696809+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
721	75	venta	Venta FAC-20260503-7284 (Efectivo)	600	734	3	2026-05-03 03:54:15.937798+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
731	76	venta	Venta FAC-20260504-1622 (Efectivo)	600	744	3	2026-05-04 02:28:56.836033+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
745	80	venta	Venta FAC-20260511-2476 (Efectivo)	600	758	3	2026-05-11 03:48:24.282878+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
637	60	venta	Venta FAC-20260421-8192 (Efectivo)	800	640	3	2026-04-22 03:14:30.934103+00	\N
638	60	venta	Venta FAC-20260421-9726 (Efectivo)	800	641	3	2026-04-22 03:14:31.293178+00	\N
649	67	venta	Venta FAC-20260424-301 (Efectivo)	30	663	3	2026-04-24 20:45:56.44773+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
659	67	venta	Venta FAC-20260425-3221 (Efectivo)	600	673	3	2026-04-25 03:17:44.933791+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
669	68	venta	Venta FAC-20260426-871 (Efectivo)	2100	683	3	2026-04-26 02:00:36.738105+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
679	69	venta	Venta FAC-20260426-3540 (Efectivo)	200	693	3	2026-04-26 22:54:16.502126+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
689	71	venta	Venta FAC-20260429-25 (Efectivo)	1150	703	3	2026-04-29 03:09:54.119397+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
700	74	venta	Venta FAC-20260502-3212 (Efectivo)	950	713	3	2026-05-02 00:51:10.9295+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
712	75	venta	Venta FAC-20260503-5212 (Efectivo)	200	725	3	2026-05-03 02:25:20.145187+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
722	75	venta	Venta FAC-20260503-1613 (Efectivo)	800	735	3	2026-05-03 03:55:12.742014+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
732	77	venta	Venta FAC-20260505-6203 (Efectivo)	200	745	3	2026-05-05 01:09:14.860983+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
746	80	venta	Venta FAC-20260511-9571 (Efectivo)	450	759	3	2026-05-11 03:49:08.571289+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
747	80	venta	Venta FAC-20260511-6253 (Efectivo)	800	760	3	2026-05-11 03:49:38.301621+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
639	60	venta	Venta FAC-20260421-6521 (Efectivo)	700	642	3	2026-04-22 03:40:38.944659+00	\N
650	67	venta	Venta FAC-20260424-4388 (Efectivo)	30	664	3	2026-04-24 20:45:57.459612+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
660	67	venta	Venta FAC-20260425-2267 (Efectivo)	200	674	3	2026-04-25 04:12:59.053806+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
670	68	venta	Venta FAC-20260426-5695 (Efectivo)	300	684	3	2026-04-26 02:17:53.780265+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
680	69	venta	Venta FAC-20260426-1714 (Efectivo)	200	694	3	2026-04-26 23:48:22.992897+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
690	73	salida	Mantenimiento (Efectivo)	1	\N	2	2026-04-30 11:31:10.45367+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
701	74	venta	Venta FAC-20260502-6211 (Efectivo)	400	714	3	2026-05-02 00:51:53.731196+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
713	75	venta	Venta FAC-20260503-4011 (Efectivo)	200	726	3	2026-05-03 02:26:58.174709+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
723	75	venta	Venta FAC-20260503-9668 (Efectivo)	400	736	3	2026-05-03 03:57:25.433573+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
733	78	venta	Venta FAC-20260505-6207 (Efectivo)	200	746	3	2026-05-05 23:28:16.052825+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
748	81	venta	Venta FAC-20260512-1751 (Efectivo)	600	761	3	2026-05-12 03:19:25.697718+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
1	1	venta	Venta FAC-20260224-2873 (Efectivo)	200	1	2	2026-02-24 18:50:50.732761+00	11111111-1111-1111-1111-111111111111
2	2	venta	Venta FAC-20260224-3182 (Efectivo)	400	2	3	2026-02-24 20:06:03.768986+00	11111111-1111-1111-1111-111111111111
3	3	venta	Venta FAC-20260224-5694 (Efectivo)	200	3	4	2026-02-24 20:57:31.530676+00	11111111-1111-1111-1111-111111111111
4	3	venta	Venta FAC-20260224-8312 (Efectivo)	400	4	4	2026-02-24 20:59:53.904424+00	11111111-1111-1111-1111-111111111111
5	27	venta	Venta FAC-20260327-5771 (Efectivo)	175	13	3	2026-03-27 14:28:41.467508+00	11111111-1111-1111-1111-111111111111
6	27	salida	Cancelación Venta FAC-20260327-5771 (Efectivo)	175	13	3	2026-03-27 14:30:04.173082+00	11111111-1111-1111-1111-111111111111
7	36	venta	Venta FAC-20260328-8353 (Efectivo)	600	14	3	2026-03-28 21:40:09.246207+00	11111111-1111-1111-1111-111111111111
8	36	venta	Venta FAC-20260328-7419 (Efectivo)	400	15	3	2026-03-28 22:24:58.313419+00	11111111-1111-1111-1111-111111111111
9	36	venta	Venta FAC-20260328-5016 (Efectivo)	200	16	3	2026-03-28 23:29:55.832998+00	11111111-1111-1111-1111-111111111111
10	36	venta	Venta FAC-20260328-8169 (Efectivo)	200	17	3	2026-03-28 23:31:28.874928+00	11111111-1111-1111-1111-111111111111
11	36	venta	Venta FAC-20260328-2862 (Efectivo)	200	18	3	2026-03-28 23:40:44.096549+00	11111111-1111-1111-1111-111111111111
12	36	venta	Venta FAC-20260328-5578 (Efectivo)	200	19	3	2026-03-28 23:52:36.423832+00	11111111-1111-1111-1111-111111111111
13	36	venta	Venta FAC-20260328-4524 (Efectivo)	200	20	3	2026-03-28 23:56:55.169876+00	11111111-1111-1111-1111-111111111111
14	36	venta	Venta FAC-20260328-7645 (Efectivo)	200	21	3	2026-03-29 00:14:48.590084+00	11111111-1111-1111-1111-111111111111
15	36	venta	Venta FAC-20260328-6121 (Efectivo)	200	22	3	2026-03-29 00:23:26.772296+00	11111111-1111-1111-1111-111111111111
16	36	venta	Venta FAC-20260328-6900 (Efectivo)	200	23	3	2026-03-29 00:37:07.720163+00	11111111-1111-1111-1111-111111111111
17	36	venta	Venta FAC-20260328-3943 (Efectivo)	200	24	3	2026-03-29 00:41:04.596273+00	11111111-1111-1111-1111-111111111111
18	36	venta	Venta FAC-20260328-6578 (Efectivo)	200	25	3	2026-03-29 00:44:27.266487+00	11111111-1111-1111-1111-111111111111
19	36	venta	Venta FAC-20260328-3063 (Efectivo)	200	26	3	2026-03-29 00:51:43.726962+00	11111111-1111-1111-1111-111111111111
20	36	venta	Venta FAC-20260328-3937 (Efectivo)	200	27	3	2026-03-29 00:54:45.016098+00	11111111-1111-1111-1111-111111111111
21	36	venta	Venta FAC-20260328-5201 (Efectivo)	400	28	3	2026-03-29 01:05:35.786915+00	11111111-1111-1111-1111-111111111111
22	36	venta	Venta FAC-20260328-7454 (Efectivo)	200	29	3	2026-03-29 01:07:58.085032+00	11111111-1111-1111-1111-111111111111
23	36	venta	Venta FAC-20260328-8545 (Efectivo)	200	30	3	2026-03-29 01:11:39.183597+00	11111111-1111-1111-1111-111111111111
24	36	venta	Venta FAC-20260328-4013 (Efectivo)	200	31	3	2026-03-29 01:19:14.856379+00	11111111-1111-1111-1111-111111111111
25	36	venta	Venta FAC-20260328-6687 (Efectivo)	200	32	3	2026-03-29 01:23:17.330788+00	11111111-1111-1111-1111-111111111111
26	36	venta	Venta FAC-20260328-6107 (Efectivo)	200	33	3	2026-03-29 01:23:47.525536+00	11111111-1111-1111-1111-111111111111
27	36	venta	Venta FAC-20260328-8294 (Efectivo)	200	34	3	2026-03-29 01:36:38.853593+00	11111111-1111-1111-1111-111111111111
28	36	venta	Venta FAC-20260328-1331 (Efectivo)	400	35	3	2026-03-29 01:41:31.982257+00	11111111-1111-1111-1111-111111111111
29	36	venta	Venta FAC-20260328-8038 (Efectivo)	200	36	3	2026-03-29 01:43:08.618567+00	11111111-1111-1111-1111-111111111111
30	36	venta	Venta FAC-20260328-2030 (Efectivo)	200	37	3	2026-03-29 01:55:02.611249+00	11111111-1111-1111-1111-111111111111
31	36	venta	Venta FAC-20260328-0213 (Efectivo)	400	38	3	2026-03-29 01:56:20.859637+00	11111111-1111-1111-1111-111111111111
32	36	venta	Venta FAC-20260328-5659 (Efectivo)	200	39	3	2026-03-29 02:03:06.742474+00	11111111-1111-1111-1111-111111111111
33	36	venta	Venta FAC-20260328-1814 (Efectivo)	200	40	3	2026-03-29 02:04:02.607823+00	11111111-1111-1111-1111-111111111111
34	36	venta	Venta FAC-20260328-9763 (Efectivo)	50	41	3	2026-03-29 02:04:30.430426+00	11111111-1111-1111-1111-111111111111
35	36	venta	Venta FAC-20260328-2553 (Efectivo)	200	42	3	2026-03-29 02:15:03.226004+00	11111111-1111-1111-1111-111111111111
36	36	venta	Venta FAC-20260328-4129 (Efectivo)	400	43	3	2026-03-29 02:19:15.004109+00	11111111-1111-1111-1111-111111111111
37	36	venta	Venta FAC-20260328-3580 (Efectivo)	200	44	3	2026-03-29 02:23:34.114689+00	11111111-1111-1111-1111-111111111111
38	36	venta	Venta FAC-20260328-7440 (Efectivo)	200	45	3	2026-03-29 02:24:38.452964+00	11111111-1111-1111-1111-111111111111
39	36	venta	Venta FAC-20260328-3812 (Efectivo)	200	46	3	2026-03-29 02:29:24.428296+00	11111111-1111-1111-1111-111111111111
40	36	venta	Venta FAC-20260328-5234 (Efectivo)	200	47	3	2026-03-29 02:29:25.736993+00	11111111-1111-1111-1111-111111111111
41	36	venta	Venta FAC-20260328-2742 (Efectivo)	200	48	3	2026-03-29 02:34:23.839418+00	11111111-1111-1111-1111-111111111111
42	36	venta	Venta FAC-20260328-1201 (Efectivo)	200	49	3	2026-03-29 02:36:02.037355+00	11111111-1111-1111-1111-111111111111
43	36	venta	Venta FAC-20260328-1219 (Efectivo)	400	50	3	2026-03-29 02:44:51.903748+00	11111111-1111-1111-1111-111111111111
44	36	venta	Venta FAC-20260328-0429 (Efectivo)	200	51	3	2026-03-29 02:45:20.927523+00	11111111-1111-1111-1111-111111111111
45	36	venta	Venta FAC-20260328-7836 (Efectivo)	200	52	3	2026-03-29 02:45:38.333475+00	11111111-1111-1111-1111-111111111111
46	36	venta	Venta FAC-20260328-7877 (Efectivo)	200	53	3	2026-03-29 02:52:28.887201+00	11111111-1111-1111-1111-111111111111
47	36	venta	Venta FAC-20260328-9369 (Efectivo)	200	54	3	2026-03-29 02:57:19.916839+00	11111111-1111-1111-1111-111111111111
48	36	venta	Venta FAC-20260328-9459 (Efectivo)	200	55	3	2026-03-29 03:02:59.973664+00	11111111-1111-1111-1111-111111111111
49	36	venta	Venta FAC-20260328-0775 (Efectivo)	200	56	3	2026-03-29 03:03:01.21594+00	11111111-1111-1111-1111-111111111111
50	36	venta	Venta FAC-20260328-8030 (Efectivo)	800	57	3	2026-03-29 03:03:38.908067+00	11111111-1111-1111-1111-111111111111
51	36	venta	Venta FAC-20260328-3962 (Efectivo)	200	58	3	2026-03-29 03:07:44.599605+00	11111111-1111-1111-1111-111111111111
52	36	venta	Venta FAC-20260328-3086 (Efectivo)	200	59	3	2026-03-29 03:08:13.539068+00	11111111-1111-1111-1111-111111111111
53	36	venta	Venta FAC-20260328-5964 (Efectivo)	200	60	3	2026-03-29 03:20:36.580611+00	11111111-1111-1111-1111-111111111111
54	36	venta	Venta FAC-20260328-5870 (Efectivo)	200	61	3	2026-03-29 03:25:56.480125+00	11111111-1111-1111-1111-111111111111
55	36	venta	Venta FAC-20260328-8450 (Efectivo)	400	62	3	2026-03-29 03:27:29.262336+00	11111111-1111-1111-1111-111111111111
56	36	venta	Venta FAC-20260328-3278 (Efectivo)	200	63	3	2026-03-29 03:29:53.784932+00	11111111-1111-1111-1111-111111111111
57	36	venta	Venta FAC-20260328-6389 (Efectivo)	400	64	3	2026-03-29 03:31:17.796804+00	11111111-1111-1111-1111-111111111111
58	36	venta	Venta FAC-20260328-6629 (Efectivo)	200	65	3	2026-03-29 03:32:17.210058+00	11111111-1111-1111-1111-111111111111
59	36	venta	Venta FAC-20260328-9061 (Efectivo)	400	66	3	2026-03-29 03:40:59.864095+00	11111111-1111-1111-1111-111111111111
60	36	venta	Venta FAC-20260328-8400 (Efectivo)	400	67	3	2026-03-29 03:41:59.2389+00	11111111-1111-1111-1111-111111111111
61	36	venta	Venta FAC-20260328-8747 (Efectivo)	200	68	3	2026-03-29 03:55:49.543362+00	11111111-1111-1111-1111-111111111111
62	36	venta	Venta FAC-20260328-6093 (Efectivo)	200	69	3	2026-03-29 04:03:46.771261+00	11111111-1111-1111-1111-111111111111
63	36	venta	Venta FAC-20260328-5816 (Efectivo)	200	70	3	2026-03-29 04:11:26.478287+00	11111111-1111-1111-1111-111111111111
64	36	venta	Venta FAC-20260328-5962 (Efectivo)	200	71	3	2026-03-29 04:12:26.442606+00	11111111-1111-1111-1111-111111111111
65	36	venta	Venta FAC-20260328-8699 (Efectivo)	200	72	3	2026-03-29 04:23:59.128386+00	11111111-1111-1111-1111-111111111111
66	36	venta	Venta FAC-20260328-3999 (Efectivo)	700	73	3	2026-03-29 04:25:54.503905+00	11111111-1111-1111-1111-111111111111
67	36	venta	Venta FAC-20260328-1410 (Efectivo)	200	74	3	2026-03-29 04:31:12.50017+00	11111111-1111-1111-1111-111111111111
68	36	venta	Venta FAC-20260328-4479 (Efectivo)	600	75	3	2026-03-29 04:35:15.065449+00	11111111-1111-1111-1111-111111111111
69	36	venta	Venta FAC-20260328-6011 (Efectivo)	400	76	3	2026-03-29 04:45:37.060955+00	11111111-1111-1111-1111-111111111111
70	36	venta	Venta FAC-20260328-2293 (Efectivo)	200	77	3	2026-03-29 04:56:13.008557+00	11111111-1111-1111-1111-111111111111
71	36	venta	Venta FAC-20260328-4637 (Efectivo)	800	78	3	2026-03-29 05:00:15.106279+00	11111111-1111-1111-1111-111111111111
72	37	venta	Venta FAC-20260329-0986 (Efectivo)	1000	79	3	2026-03-29 20:40:12.93808+00	11111111-1111-1111-1111-111111111111
73	37	venta	Venta FAC-20260329-7317 (Efectivo)	400	80	3	2026-03-29 21:33:09.53109+00	11111111-1111-1111-1111-111111111111
74	37	venta	Venta FAC-20260329-9637 (Efectivo)	600	81	3	2026-03-29 21:39:11.601777+00	11111111-1111-1111-1111-111111111111
75	37	venta	Venta FAC-20260329-7851 (Efectivo)	200	82	3	2026-03-29 21:45:30.014057+00	11111111-1111-1111-1111-111111111111
76	37	venta	Venta FAC-20260329-8216 (Efectivo)	1400	83	3	2026-03-29 21:49:20.039758+00	11111111-1111-1111-1111-111111111111
77	37	venta	Venta FAC-20260329-0801 (Efectivo)	200	84	3	2026-03-29 22:01:12.613873+00	11111111-1111-1111-1111-111111111111
78	37	venta	Venta FAC-20260329-2046 (Efectivo)	200	85	3	2026-03-29 22:01:13.772754+00	11111111-1111-1111-1111-111111111111
79	37	venta	Venta FAC-20260329-8333 (Efectivo)	600	86	3	2026-03-29 22:44:00.292797+00	11111111-1111-1111-1111-111111111111
80	37	venta	Venta FAC-20260329-7102 (Efectivo)	200	87	3	2026-03-29 22:44:28.827298+00	11111111-1111-1111-1111-111111111111
81	37	venta	Venta FAC-20260329-3483 (Efectivo)	1000	88	3	2026-03-29 23:38:15.248573+00	11111111-1111-1111-1111-111111111111
82	37	venta	Venta FAC-20260329-7602 (Efectivo)	400	89	3	2026-03-29 23:40:49.336187+00	11111111-1111-1111-1111-111111111111
83	37	venta	Venta FAC-20260329-3145 (Efectivo)	200	90	3	2026-03-29 23:48:35.145465+00	11111111-1111-1111-1111-111111111111
84	37	venta	Venta FAC-20260329-2659 (Efectivo)	200	91	3	2026-03-29 23:49:34.41999+00	11111111-1111-1111-1111-111111111111
85	37	venta	Venta FAC-20260329-1328 (Efectivo)	400	92	3	2026-03-29 23:52:43.03+00	11111111-1111-1111-1111-111111111111
86	37	venta	Venta FAC-20260329-3682 (Efectivo)	200	93	3	2026-03-30 00:38:05.354984+00	11111111-1111-1111-1111-111111111111
87	37	venta	Venta FAC-20260329-8825 (Efectivo)	150	94	3	2026-03-30 00:44:10.621044+00	11111111-1111-1111-1111-111111111111
88	37	venta	Venta FAC-20260329-9965 (Efectivo)	200	95	3	2026-03-30 01:16:52.28431+00	11111111-1111-1111-1111-111111111111
89	37	venta	Venta FAC-20260329-6510 (Efectivo)	600	96	3	2026-03-30 01:23:08.128667+00	11111111-1111-1111-1111-111111111111
90	37	venta	Venta FAC-20260329-7940 (Efectivo)	600	97	3	2026-03-30 01:27:39.600506+00	11111111-1111-1111-1111-111111111111
91	37	venta	Venta FAC-20260329-8165 (Efectivo)	1050	98	3	2026-03-30 01:30:09.708559+00	11111111-1111-1111-1111-111111111111
92	37	venta	Venta FAC-20260329-6488 (Efectivo)	1050	99	3	2026-03-30 01:32:28.045495+00	11111111-1111-1111-1111-111111111111
93	37	venta	Venta FAC-20260329-3036 (Efectivo)	1600	100	3	2026-03-30 01:42:34.618043+00	11111111-1111-1111-1111-111111111111
94	37	venta	Venta FAC-20260329-9197 (Efectivo)	200	101	3	2026-03-30 01:58:11.526023+00	11111111-1111-1111-1111-111111111111
95	37	venta	Venta FAC-20260329-7847 (Efectivo)	200	102	3	2026-03-30 02:03:49.444491+00	11111111-1111-1111-1111-111111111111
96	37	venta	Venta FAC-20260329-7270 (Efectivo)	200	103	3	2026-03-30 02:06:48.826541+00	11111111-1111-1111-1111-111111111111
97	37	venta	Venta FAC-20260329-3623 (Efectivo)	200	104	3	2026-03-30 02:15:15.657469+00	11111111-1111-1111-1111-111111111111
98	37	venta	Venta FAC-20260329-8748 (Efectivo)	450	105	3	2026-03-30 02:17:50.38942+00	11111111-1111-1111-1111-111111111111
99	37	venta	Venta FAC-20260329-6842 (Efectivo)	650	106	3	2026-03-30 02:20:18.740704+00	11111111-1111-1111-1111-111111111111
100	37	venta	Venta FAC-20260329-9981 (Efectivo)	125	107	3	2026-03-30 02:29:42.311222+00	11111111-1111-1111-1111-111111111111
101	37	venta	Venta FAC-20260329-5656 (Efectivo)	200	108	3	2026-03-30 02:35:17.545391+00	11111111-1111-1111-1111-111111111111
102	37	venta	Venta FAC-20260329-9478 (Efectivo)	200	109	3	2026-03-30 02:35:31.039748+00	11111111-1111-1111-1111-111111111111
103	37	venta	Venta FAC-20260329-6174 (Efectivo)	750	110	3	2026-03-30 02:58:37.81322+00	11111111-1111-1111-1111-111111111111
104	37	venta	Venta FAC-20260329-8917 (Efectivo)	200	111	3	2026-03-30 02:59:50.458601+00	11111111-1111-1111-1111-111111111111
105	37	venta	Venta FAC-20260329-1118 (Efectivo)	350	112	3	2026-03-30 03:20:12.94761+00	11111111-1111-1111-1111-111111111111
106	37	venta	Venta FAC-20260329-4305 (Efectivo)	600	113	3	2026-03-30 03:39:26.185627+00	11111111-1111-1111-1111-111111111111
107	37	venta	Venta FAC-20260329-4960 (Efectivo)	200	114	3	2026-03-30 04:01:16.640611+00	11111111-1111-1111-1111-111111111111
108	37	venta	Venta FAC-20260329-3850 (Efectivo)	150	115	3	2026-03-30 04:15:05.487603+00	11111111-1111-1111-1111-111111111111
109	37	venta	Venta FAC-20260329-3664 (Efectivo)	400	116	3	2026-03-30 04:16:25.056426+00	11111111-1111-1111-1111-111111111111
110	37	venta	Venta FAC-20260329-4207 (Efectivo)	400	117	3	2026-03-30 04:17:35.680828+00	11111111-1111-1111-1111-111111111111
111	37	entrada	Depósito inicial (Efectivo)	5000	\N	3	2026-03-30 20:36:59.525711+00	11111111-1111-1111-1111-111111111111
112	38	venta	Venta FAC-20260330-9219 (Efectivo)	200	118	3	2026-03-30 21:48:22.768586+00	11111111-1111-1111-1111-111111111111
113	38	venta	Venta FAC-20260330-3478 (Efectivo)	200	119	3	2026-03-30 21:57:16.779059+00	11111111-1111-1111-1111-111111111111
114	38	venta	Venta FAC-20260330-0171 (Efectivo)	550	120	3	2026-03-30 22:19:33.633075+00	11111111-1111-1111-1111-111111111111
115	38	venta	Venta FAC-20260330-6492 (Efectivo)	400	121	3	2026-03-31 00:25:49.457585+00	11111111-1111-1111-1111-111111111111
116	38	venta	Venta FAC-20260330-9854 (Efectivo)	800	122	3	2026-03-31 01:26:43.29181+00	11111111-1111-1111-1111-111111111111
117	38	venta	Venta FAC-20260330-3471 (Efectivo)	200	123	3	2026-03-31 01:38:06.412044+00	11111111-1111-1111-1111-111111111111
118	38	venta	Venta FAC-20260330-3226 (Efectivo)	400	124	3	2026-03-31 01:58:16.003044+00	11111111-1111-1111-1111-111111111111
119	38	venta	Venta FAC-20260330-8053 (Efectivo)	1200	125	3	2026-03-31 02:49:01.028471+00	11111111-1111-1111-1111-111111111111
120	38	venta	Venta FAC-20260330-2359 (Efectivo)	600	126	3	2026-03-31 02:50:25.543582+00	11111111-1111-1111-1111-111111111111
121	39	venta	Venta FAC-20260331-8195 (Efectivo)	200	127	3	2026-03-31 22:06:22.53167+00	11111111-1111-1111-1111-111111111111
122	39	venta	Venta FAC-20260331-9658 (Efectivo)	200	128	3	2026-03-31 22:06:33.160449+00	11111111-1111-1111-1111-111111111111
123	39	venta	Venta FAC-20260331-4847 (Efectivo)	150	129	3	2026-03-31 22:06:48.286852+00	11111111-1111-1111-1111-111111111111
124	39	venta	Venta FAC-20260331-7695 (Efectivo)	750	130	3	2026-03-31 22:35:11.622805+00	11111111-1111-1111-1111-111111111111
125	39	venta	Venta FAC-20260331-8176 (Efectivo)	200	131	3	2026-03-31 22:42:41.62019+00	11111111-1111-1111-1111-111111111111
126	39	venta	Venta FAC-20260331-7993 (Efectivo)	200	132	3	2026-03-31 23:05:02.326465+00	11111111-1111-1111-1111-111111111111
127	39	venta	Venta FAC-20260331-2428 (Efectivo)	200	133	3	2026-03-31 23:26:06.543793+00	11111111-1111-1111-1111-111111111111
128	39	venta	Venta FAC-20260331-6375 (Efectivo)	600	134	3	2026-03-31 23:26:50.147186+00	11111111-1111-1111-1111-111111111111
129	39	venta	Venta FAC-20260331-5717 (Efectivo)	200	135	3	2026-03-31 23:56:49.54643+00	11111111-1111-1111-1111-111111111111
130	39	venta	Venta FAC-20260331-9765 (Efectivo)	200	136	3	2026-04-01 00:36:03.252287+00	11111111-1111-1111-1111-111111111111
131	39	venta	Venta FAC-20260331-4254 (Efectivo)	400	137	3	2026-04-01 00:48:47.732815+00	11111111-1111-1111-1111-111111111111
132	39	venta	Venta FAC-20260331-6675 (Efectivo)	200	138	3	2026-04-01 01:03:40.2977+00	11111111-1111-1111-1111-111111111111
133	39	venta	Venta FAC-20260331-5047 (Efectivo)	200	139	3	2026-04-01 01:25:19.083995+00	11111111-1111-1111-1111-111111111111
134	39	venta	Venta FAC-20260331-2528 (Efectivo)	200	140	3	2026-04-01 01:48:26.042766+00	11111111-1111-1111-1111-111111111111
135	39	venta	Venta FAC-20260331-2394 (Efectivo)	200	141	3	2026-04-01 02:00:15.726569+00	11111111-1111-1111-1111-111111111111
136	39	venta	Venta FAC-20260331-8266 (Efectivo)	150	142	3	2026-04-01 02:02:11.627636+00	11111111-1111-1111-1111-111111111111
137	39	venta	Venta FAC-20260331-0405 (Efectivo)	200	143	3	2026-04-01 02:12:23.670873+00	11111111-1111-1111-1111-111111111111
138	39	venta	Venta FAC-20260331-1227 (Efectivo)	400	144	3	2026-04-01 02:22:04.634617+00	11111111-1111-1111-1111-111111111111
139	39	venta	Venta FAC-20260331-6515 (Efectivo)	400	145	3	2026-04-01 02:35:10.188704+00	11111111-1111-1111-1111-111111111111
140	39	venta	Venta FAC-20260331-5521 (Efectivo)	200	146	3	2026-04-01 02:43:29.032314+00	11111111-1111-1111-1111-111111111111
141	39	venta	Venta FAC-20260331-8986 (Efectivo)	400	147	3	2026-04-01 03:07:12.398341+00	11111111-1111-1111-1111-111111111111
142	39	venta	Venta FAC-20260331-4737 (Efectivo)	200	148	3	2026-04-01 03:19:58.469894+00	11111111-1111-1111-1111-111111111111
143	39	venta	Venta FAC-20260331-4586 (Efectivo)	200	149	3	2026-04-01 03:38:07.796612+00	11111111-1111-1111-1111-111111111111
144	39	venta	Venta FAC-20260331-9985 (Efectivo)	200	150	3	2026-04-01 03:45:43.663306+00	11111111-1111-1111-1111-111111111111
145	39	venta	Venta FAC-20260331-6222 (Efectivo)	1200	151	3	2026-04-01 04:03:59.801662+00	11111111-1111-1111-1111-111111111111
146	39	venta	Venta FAC-20260331-6574 (Efectivo)	200	152	3	2026-04-01 04:06:29.772518+00	11111111-1111-1111-1111-111111111111
147	39	venta	Venta FAC-20260331-2404 (Efectivo)	750	153	3	2026-04-01 04:06:55.685914+00	11111111-1111-1111-1111-111111111111
148	39	venta	Venta FAC-20260331-4246 (Efectivo)	200	154	3	2026-04-01 04:08:07.497891+00	11111111-1111-1111-1111-111111111111
149	39	venta	Venta FAC-20260331-3583 (Efectivo)	600	155	3	2026-04-01 04:11:16.9126+00	11111111-1111-1111-1111-111111111111
150	39	venta	Venta FAC-20260331-3573 (Efectivo)	150	156	3	2026-04-01 04:12:36.792036+00	11111111-1111-1111-1111-111111111111
151	39	venta	Venta FAC-20260331-9800 (Efectivo)	100	157	3	2026-04-01 04:17:03.005665+00	11111111-1111-1111-1111-111111111111
152	39	venta	Venta FAC-20260331-0513 (Efectivo)	100	158	3	2026-04-01 04:17:23.657977+00	11111111-1111-1111-1111-111111111111
153	40	venta	Venta FAC-20260401-1273 (Efectivo)	200	159	3	2026-04-01 22:28:06.684+00	11111111-1111-1111-1111-111111111111
154	40	venta	Venta FAC-20260401-8800 (Efectivo)	200	160	3	2026-04-01 22:28:54.118684+00	11111111-1111-1111-1111-111111111111
155	40	venta	Venta FAC-20260401-6345 (Efectivo)	200	161	3	2026-04-01 22:41:31.936263+00	11111111-1111-1111-1111-111111111111
156	40	venta	Venta FAC-20260401-8087 (Efectivo)	200	162	3	2026-04-01 22:52:43.718747+00	11111111-1111-1111-1111-111111111111
157	40	venta	Venta FAC-20260401-8423 (Efectivo)	400	163	3	2026-04-01 22:58:23.667093+00	11111111-1111-1111-1111-111111111111
158	40	venta	Venta FAC-20260401-4208 (Efectivo)	200	164	3	2026-04-01 23:01:49.75534+00	11111111-1111-1111-1111-111111111111
159	40	venta	Venta FAC-20260401-4861 (Efectivo)	200	165	3	2026-04-01 23:02:30.137311+00	11111111-1111-1111-1111-111111111111
160	40	venta	Venta FAC-20260401-6700 (Efectivo)	400	166	3	2026-04-01 23:16:12.4199+00	11111111-1111-1111-1111-111111111111
161	40	venta	Venta FAC-20260401-8880 (Efectivo)	600	167	3	2026-04-01 23:17:34.137039+00	11111111-1111-1111-1111-111111111111
162	40	venta	Venta FAC-20260401-0363 (Efectivo)	200	168	3	2026-04-01 23:19:15.644713+00	11111111-1111-1111-1111-111111111111
163	40	venta	Venta FAC-20260401-0381 (Efectivo)	150	169	3	2026-04-01 23:42:36.284596+00	11111111-1111-1111-1111-111111111111
164	40	venta	Venta FAC-20260401-9813 (Efectivo)	200	170	3	2026-04-01 23:46:45.040982+00	11111111-1111-1111-1111-111111111111
165	40	venta	Venta FAC-20260401-2297 (Efectivo)	200	171	3	2026-04-01 23:51:17.887507+00	11111111-1111-1111-1111-111111111111
166	40	venta	Venta FAC-20260401-3421 (Efectivo)	200	172	3	2026-04-01 23:54:29.36731+00	11111111-1111-1111-1111-111111111111
167	40	venta	Venta FAC-20260401-5711 (Efectivo)	400	173	3	2026-04-02 00:08:50.905387+00	11111111-1111-1111-1111-111111111111
168	40	venta	Venta FAC-20260401-2581 (Efectivo)	200	174	3	2026-04-02 00:09:37.810245+00	11111111-1111-1111-1111-111111111111
169	40	venta	Venta FAC-20260401-1728 (Efectivo)	200	175	3	2026-04-02 00:21:26.907733+00	11111111-1111-1111-1111-111111111111
170	40	venta	Venta FAC-20260401-2895 (Efectivo)	150	176	3	2026-04-02 00:22:28.435204+00	11111111-1111-1111-1111-111111111111
171	40	venta	Venta FAC-20260401-3301 (Efectivo)	200	177	3	2026-04-02 00:28:28.563935+00	11111111-1111-1111-1111-111111111111
172	40	venta	Venta FAC-20260401-3104 (Efectivo)	400	178	3	2026-04-02 00:35:38.481306+00	11111111-1111-1111-1111-111111111111
173	40	venta	Venta FAC-20260401-6240 (Efectivo)	200	179	3	2026-04-02 01:01:41.717533+00	11111111-1111-1111-1111-111111111111
174	40	venta	Venta FAC-20260401-9509 (Efectivo)	200	180	3	2026-04-02 01:02:24.895329+00	11111111-1111-1111-1111-111111111111
175	40	venta	Venta FAC-20260401-9927 (Efectivo)	200	181	3	2026-04-02 01:08:25.172179+00	11111111-1111-1111-1111-111111111111
176	40	venta	Venta FAC-20260401-8029 (Efectivo)	200	182	3	2026-04-02 01:13:43.275295+00	11111111-1111-1111-1111-111111111111
177	40	venta	Venta FAC-20260401-2382 (Efectivo)	150	183	3	2026-04-02 01:23:38.161892+00	11111111-1111-1111-1111-111111111111
178	40	venta	Venta FAC-20260401-2558 (Efectivo)	200	184	3	2026-04-02 01:27:07.76277+00	11111111-1111-1111-1111-111111111111
179	40	venta	Venta FAC-20260401-6334 (Efectivo)	150	185	3	2026-04-02 01:35:31.766404+00	11111111-1111-1111-1111-111111111111
180	40	venta	Venta FAC-20260401-4026 (Efectivo)	200	186	3	2026-04-02 01:35:59.208333+00	11111111-1111-1111-1111-111111111111
181	40	venta	Venta FAC-20260401-1373 (Efectivo)	200	187	3	2026-04-02 01:46:36.721874+00	11111111-1111-1111-1111-111111111111
182	40	venta	Venta FAC-20260401-1831 (Efectivo)	200	188	3	2026-04-02 01:50:36.955656+00	11111111-1111-1111-1111-111111111111
183	40	venta	Venta FAC-20260401-1758 (Efectivo)	150	189	3	2026-04-02 02:02:16.969706+00	11111111-1111-1111-1111-111111111111
184	40	venta	Venta FAC-20260401-8173 (Efectivo)	200	190	3	2026-04-02 02:03:13.412921+00	11111111-1111-1111-1111-111111111111
185	40	venta	Venta FAC-20260401-5572 (Efectivo)	200	191	3	2026-04-02 02:04:20.693044+00	11111111-1111-1111-1111-111111111111
186	40	venta	Venta FAC-20260401-1232 (Efectivo)	200	192	3	2026-04-02 02:05:36.373211+00	11111111-1111-1111-1111-111111111111
187	40	venta	Venta FAC-20260401-8506 (Efectivo)	400	193	3	2026-04-02 02:07:23.643985+00	11111111-1111-1111-1111-111111111111
188	40	venta	Venta FAC-20260401-4868 (Efectivo)	200	194	3	2026-04-02 02:20:10.089323+00	11111111-1111-1111-1111-111111111111
189	40	venta	Venta FAC-20260401-6093 (Efectivo)	200	195	3	2026-04-02 02:20:11.241853+00	11111111-1111-1111-1111-111111111111
190	40	venta	Venta FAC-20260401-8082 (Efectivo)	550	196	3	2026-04-02 02:32:44.65504+00	11111111-1111-1111-1111-111111111111
191	40	venta	Venta FAC-20260401-5129 (Efectivo)	200	197	3	2026-04-02 02:47:01.245598+00	11111111-1111-1111-1111-111111111111
192	40	venta	Venta FAC-20260401-4478 (Efectivo)	200	198	3	2026-04-02 02:47:59.738982+00	11111111-1111-1111-1111-111111111111
193	40	venta	Venta FAC-20260401-6507 (Efectivo)	150	199	3	2026-04-02 02:49:21.813419+00	11111111-1111-1111-1111-111111111111
194	40	venta	Venta FAC-20260401-3761 (Efectivo)	350	200	3	2026-04-02 03:10:39.539552+00	11111111-1111-1111-1111-111111111111
195	40	venta	Venta FAC-20260401-1184 (Efectivo)	200	201	3	2026-04-02 03:17:06.403849+00	11111111-1111-1111-1111-111111111111
196	40	venta	Venta FAC-20260401-8262 (Efectivo)	200	202	3	2026-04-02 03:19:13.351835+00	11111111-1111-1111-1111-111111111111
197	40	venta	Venta FAC-20260401-6317 (Efectivo)	3000	203	3	2026-04-02 03:48:32.501659+00	11111111-1111-1111-1111-111111111111
198	40	venta	Venta FAC-20260401-2145 (Efectivo)	400	204	3	2026-04-02 03:54:57.24928+00	11111111-1111-1111-1111-111111111111
199	41	venta	Venta FAC-20260402-1860 (Efectivo)	15	205	3	2026-04-02 21:15:05.528861+00	11111111-1111-1111-1111-111111111111
200	41	venta	Venta FAC-20260402-3480 (Efectivo)	200	206	3	2026-04-02 21:47:47.012622+00	11111111-1111-1111-1111-111111111111
201	41	venta	Venta FAC-20260402-5738 (Efectivo)	200	207	3	2026-04-02 22:04:19.15705+00	11111111-1111-1111-1111-111111111111
202	41	venta	Venta FAC-20260402-1386 (Efectivo)	600	208	3	2026-04-02 22:18:44.638811+00	11111111-1111-1111-1111-111111111111
203	41	venta	Venta FAC-20260402-8758 (Efectivo)	600	209	3	2026-04-02 22:48:21.897935+00	11111111-1111-1111-1111-111111111111
204	41	venta	Venta FAC-20260402-5663 (Efectivo)	200	210	3	2026-04-02 22:48:58.786617+00	11111111-1111-1111-1111-111111111111
205	41	venta	Venta FAC-20260402-2927 (Efectivo)	200	211	3	2026-04-02 23:06:46.022922+00	11111111-1111-1111-1111-111111111111
206	41	venta	Venta FAC-20260402-0132 (Efectivo)	400	212	3	2026-04-02 23:07:33.12086+00	11111111-1111-1111-1111-111111111111
207	41	venta	Venta FAC-20260402-3840 (Efectivo)	200	213	3	2026-04-02 23:12:37.018937+00	11111111-1111-1111-1111-111111111111
208	41	venta	Venta FAC-20260402-9852 (Efectivo)	150	214	3	2026-04-02 23:13:13.482679+00	11111111-1111-1111-1111-111111111111
209	41	venta	Venta FAC-20260402-7864 (Efectivo)	200	215	3	2026-04-02 23:20:30.993702+00	11111111-1111-1111-1111-111111111111
210	41	venta	Venta FAC-20260402-8430 (Efectivo)	200	216	3	2026-04-02 23:21:01.383645+00	11111111-1111-1111-1111-111111111111
211	41	venta	Venta FAC-20260402-0850 (Efectivo)	200	217	3	2026-04-02 23:37:34.431356+00	11111111-1111-1111-1111-111111111111
212	41	venta	Venta FAC-20260402-5269 (Efectivo)	400	218	3	2026-04-02 23:41:18.435174+00	11111111-1111-1111-1111-111111111111
213	41	venta	Venta FAC-20260402-6514 (Efectivo)	200	219	3	2026-04-03 00:05:09.842318+00	11111111-1111-1111-1111-111111111111
214	41	venta	Venta FAC-20260402-8974 (Efectivo)	50	220	3	2026-04-03 00:05:31.958259+00	11111111-1111-1111-1111-111111111111
215	41	venta	Venta FAC-20260402-8793 (Efectivo)	15	221	3	2026-04-03 00:15:02.414901+00	11111111-1111-1111-1111-111111111111
216	41	venta	Venta FAC-20260402-3249 (Efectivo)	200	222	3	2026-04-03 00:24:56.629831+00	11111111-1111-1111-1111-111111111111
217	41	venta	Venta FAC-20260402-2241 (Efectivo)	200	223	3	2026-04-03 00:28:35.147592+00	11111111-1111-1111-1111-111111111111
218	41	venta	Venta FAC-20260402-1579 (Efectivo)	200	224	3	2026-04-03 00:35:05.20266+00	11111111-1111-1111-1111-111111111111
219	41	venta	Venta FAC-20260402-5211 (Efectivo)	400	225	3	2026-04-03 00:38:48.142377+00	11111111-1111-1111-1111-111111111111
220	41	venta	Venta FAC-20260402-4947 (Efectivo)	150	226	3	2026-04-03 00:41:38.224294+00	11111111-1111-1111-1111-111111111111
221	41	venta	Venta FAC-20260402-3208 (Efectivo)	200	227	3	2026-04-03 00:53:16.076285+00	11111111-1111-1111-1111-111111111111
222	41	venta	Venta FAC-20260402-7742 (Efectivo)	200	228	3	2026-04-03 00:55:11.120105+00	11111111-1111-1111-1111-111111111111
223	41	venta	Venta FAC-20260402-5331 (Efectivo)	50	229	3	2026-04-03 01:05:28.651362+00	11111111-1111-1111-1111-111111111111
224	41	venta	Venta FAC-20260402-3781 (Efectivo)	300	230	3	2026-04-03 01:05:57.051785+00	11111111-1111-1111-1111-111111111111
225	41	venta	Venta FAC-20260402-1188 (Efectivo)	150	231	3	2026-04-03 01:06:24.083951+00	11111111-1111-1111-1111-111111111111
226	41	venta	Venta FAC-20260402-3572 (Efectivo)	200	232	3	2026-04-03 01:12:26.476023+00	11111111-1111-1111-1111-111111111111
227	41	venta	Venta FAC-20260402-9642 (Efectivo)	400	233	3	2026-04-03 01:15:02.883529+00	11111111-1111-1111-1111-111111111111
228	41	venta	Venta FAC-20260402-5612 (Efectivo)	400	234	3	2026-04-03 01:21:08.691637+00	11111111-1111-1111-1111-111111111111
229	41	venta	Venta FAC-20260402-3853 (Efectivo)	600	235	3	2026-04-03 01:23:47.030298+00	11111111-1111-1111-1111-111111111111
230	41	venta	Venta FAC-20260402-3306 (Efectivo)	200	236	3	2026-04-03 01:26:06.346817+00	11111111-1111-1111-1111-111111111111
231	41	venta	Venta FAC-20260402-4474 (Efectivo)	200	237	3	2026-04-03 01:26:37.389027+00	11111111-1111-1111-1111-111111111111
232	41	venta	Venta FAC-20260402-5357 (Efectivo)	200	238	3	2026-04-03 01:29:58.265301+00	11111111-1111-1111-1111-111111111111
233	41	venta	Venta FAC-20260402-0711 (Efectivo)	200	239	3	2026-04-03 01:33:23.628019+00	11111111-1111-1111-1111-111111111111
234	41	venta	Venta FAC-20260402-0527 (Efectivo)	200	240	3	2026-04-03 01:39:13.478998+00	11111111-1111-1111-1111-111111111111
235	41	venta	Venta FAC-20260402-3867 (Efectivo)	800	241	3	2026-04-03 01:42:46.809842+00	11111111-1111-1111-1111-111111111111
236	41	venta	Venta FAC-20260402-4207 (Efectivo)	400	242	3	2026-04-03 01:47:07.39206+00	11111111-1111-1111-1111-111111111111
237	41	venta	Venta FAC-20260402-0630 (Efectivo)	200	243	3	2026-04-03 01:50:44.078717+00	11111111-1111-1111-1111-111111111111
238	41	venta	Venta FAC-20260402-7946 (Efectivo)	200	244	3	2026-04-03 01:52:10.969628+00	11111111-1111-1111-1111-111111111111
239	41	venta	Venta FAC-20260402-0162 (Efectivo)	400	245	3	2026-04-03 01:54:43.065575+00	11111111-1111-1111-1111-111111111111
240	41	venta	Venta FAC-20260402-8627 (Efectivo)	400	246	3	2026-04-03 01:55:11.453476+00	11111111-1111-1111-1111-111111111111
241	41	venta	Venta FAC-20260402-1638 (Efectivo)	200	247	3	2026-04-03 02:00:44.524179+00	11111111-1111-1111-1111-111111111111
242	41	venta	Venta FAC-20260402-4952 (Efectivo)	600	248	3	2026-04-03 02:03:07.817967+00	11111111-1111-1111-1111-111111111111
243	41	venta	Venta FAC-20260402-6776 (Efectivo)	1050	249	3	2026-04-03 02:04:20.02802+00	11111111-1111-1111-1111-111111111111
244	41	venta	Venta FAC-20260402-7020 (Efectivo)	200	250	3	2026-04-03 02:05:30.056751+00	11111111-1111-1111-1111-111111111111
245	41	venta	Venta FAC-20260402-3038 (Efectivo)	200	251	3	2026-04-03 02:15:05.904291+00	11111111-1111-1111-1111-111111111111
246	41	venta	Venta FAC-20260402-2689 (Efectivo)	200	252	3	2026-04-03 02:15:35.554953+00	11111111-1111-1111-1111-111111111111
247	41	venta	Venta FAC-20260402-2498 (Efectivo)	200	253	3	2026-04-03 02:17:05.403775+00	11111111-1111-1111-1111-111111111111
248	41	venta	Venta FAC-20260402-7501 (Efectivo)	200	254	3	2026-04-03 02:20:10.366279+00	11111111-1111-1111-1111-111111111111
249	41	venta	Venta FAC-20260402-4167 (Efectivo)	400	255	3	2026-04-03 02:20:37.28547+00	11111111-1111-1111-1111-111111111111
250	41	venta	Venta FAC-20260402-3137 (Efectivo)	600	256	3	2026-04-03 02:23:36.207654+00	11111111-1111-1111-1111-111111111111
251	41	venta	Venta FAC-20260402-1511 (Efectivo)	200	257	3	2026-04-03 02:35:04.824392+00	11111111-1111-1111-1111-111111111111
252	41	venta	Venta FAC-20260402-0280 (Efectivo)	200	258	3	2026-04-03 02:42:53.790866+00	11111111-1111-1111-1111-111111111111
253	41	venta	Venta FAC-20260402-4953 (Efectivo)	600	259	3	2026-04-03 03:19:27.848194+00	11111111-1111-1111-1111-111111111111
254	41	venta	Venta FAC-20260402-9191 (Efectivo)	1050	260	3	2026-04-03 03:23:33.40466+00	11111111-1111-1111-1111-111111111111
255	42	venta	Venta FAC-20260404-9196 (Efectivo)	150	261	3	2026-04-04 19:35:03.734492+00	11111111-1111-1111-1111-111111111111
256	42	venta	Venta FAC-20260404-0213 (Efectivo)	150	262	3	2026-04-04 19:35:04.286445+00	11111111-1111-1111-1111-111111111111
257	42	venta	Venta FAC-20260404-1150 (Efectivo)	150	263	3	2026-04-04 19:35:05.200752+00	11111111-1111-1111-1111-111111111111
258	42	venta	Venta FAC-20260404-1767 (Efectivo)	150	264	3	2026-04-04 19:35:05.807393+00	11111111-1111-1111-1111-111111111111
259	42	venta	Venta FAC-20260404-3001 (Efectivo)	400	265	3	2026-04-04 20:49:07.705516+00	11111111-1111-1111-1111-111111111111
260	42	venta	Venta FAC-20260404-4921 (Efectivo)	400	266	3	2026-04-04 20:49:08.886081+00	11111111-1111-1111-1111-111111111111
261	42	salida	Cancelación Venta FAC-20260404-1767 (Efectivo)	150	264	2	2026-04-04 20:56:24.23919+00	11111111-1111-1111-1111-111111111111
262	42	salida	Cancelación Venta FAC-20260404-1150 (Efectivo)	150	263	2	2026-04-04 20:56:31.602478+00	11111111-1111-1111-1111-111111111111
263	42	salida	Cancelación Venta FAC-20260404-0213 (Efectivo)	150	262	2	2026-04-04 20:56:38.269721+00	11111111-1111-1111-1111-111111111111
264	42	salida	Cancelación Venta FAC-20260404-4921 (Efectivo)	400	266	2	2026-04-04 20:56:44.338249+00	11111111-1111-1111-1111-111111111111
265	43	venta	Venta FAC-20260404-4286 (Efectivo)	200	267	3	2026-04-04 21:17:59.358095+00	11111111-1111-1111-1111-111111111111
266	43	venta	Venta FAC-20260404-8647 (Efectivo)	200	268	3	2026-04-04 21:45:13.994256+00	11111111-1111-1111-1111-111111111111
267	43	venta	Venta FAC-20260404-9925 (Efectivo)	200	269	3	2026-04-04 21:46:34.888051+00	11111111-1111-1111-1111-111111111111
268	43	venta	Venta FAC-20260404-6821 (Efectivo)	150	270	3	2026-04-04 22:04:12.316249+00	11111111-1111-1111-1111-111111111111
269	43	venta	Venta FAC-20260404-1955 (Efectivo)	200	271	3	2026-04-04 22:18:07.215348+00	11111111-1111-1111-1111-111111111111
270	43	venta	Venta FAC-20260404-8872 (Efectivo)	750	272	3	2026-04-04 22:20:54.357877+00	11111111-1111-1111-1111-111111111111
271	43	venta	Venta FAC-20260404-6293 (Efectivo)	200	273	3	2026-04-04 22:27:31.680228+00	11111111-1111-1111-1111-111111111111
272	43	venta	Venta FAC-20260404-5556 (Efectivo)	150	274	3	2026-04-04 22:28:20.626982+00	11111111-1111-1111-1111-111111111111
273	43	venta	Venta FAC-20260404-6756 (Efectivo)	200	275	3	2026-04-04 22:29:01.653282+00	11111111-1111-1111-1111-111111111111
274	43	venta	Venta FAC-20260404-6389 (Efectivo)	200	276	3	2026-04-04 22:29:21.172903+00	11111111-1111-1111-1111-111111111111
275	43	venta	Venta FAC-20260404-9560 (Efectivo)	200	277	3	2026-04-04 22:42:54.777436+00	11111111-1111-1111-1111-111111111111
276	43	venta	Venta FAC-20260404-6642 (Efectivo)	200	278	3	2026-04-04 22:43:21.50118+00	11111111-1111-1111-1111-111111111111
277	43	venta	Venta FAC-20260404-9446 (Efectivo)	200	279	3	2026-04-04 22:58:54.319917+00	11111111-1111-1111-1111-111111111111
278	43	venta	Venta FAC-20260404-5835 (Efectivo)	50	280	3	2026-04-04 23:05:00.924524+00	11111111-1111-1111-1111-111111111111
279	43	venta	Venta FAC-20260404-5980 (Efectivo)	15	281	3	2026-04-04 23:08:10.874985+00	11111111-1111-1111-1111-111111111111
280	43	venta	Venta FAC-20260404-8960 (Efectivo)	800	282	3	2026-04-04 23:15:23.781202+00	11111111-1111-1111-1111-111111111111
281	43	venta	Venta FAC-20260404-9280 (Efectivo)	200	283	3	2026-04-04 23:15:44.047339+00	11111111-1111-1111-1111-111111111111
282	43	venta	Venta FAC-20260404-9721 (Efectivo)	200	284	3	2026-04-04 23:18:14.593158+00	11111111-1111-1111-1111-111111111111
283	43	venta	Venta FAC-20260404-8184 (Efectivo)	200	285	3	2026-04-04 23:21:33.18831+00	11111111-1111-1111-1111-111111111111
284	43	venta	Venta FAC-20260404-2390 (Efectivo)	200	286	3	2026-04-04 23:26:37.437723+00	11111111-1111-1111-1111-111111111111
285	43	venta	Venta FAC-20260404-1303 (Efectivo)	200	287	3	2026-04-04 23:28:36.079246+00	11111111-1111-1111-1111-111111111111
286	43	venta	Venta FAC-20260404-5651 (Efectivo)	200	288	3	2026-04-04 23:38:40.69601+00	11111111-1111-1111-1111-111111111111
287	43	venta	Venta FAC-20260404-0764 (Efectivo)	200	289	3	2026-04-04 23:47:35.926723+00	11111111-1111-1111-1111-111111111111
288	43	venta	Venta FAC-20260404-0377 (Efectivo)	200	290	3	2026-04-04 23:53:45.756895+00	11111111-1111-1111-1111-111111111111
289	43	venta	Venta FAC-20260404-4480 (Efectivo)	400	291	3	2026-04-05 00:02:29.21844+00	11111111-1111-1111-1111-111111111111
290	43	venta	Venta FAC-20260404-3415 (Efectivo)	200	292	3	2026-04-05 00:04:08.217661+00	11111111-1111-1111-1111-111111111111
291	43	venta	Venta FAC-20260404-4692 (Efectivo)	200	293	3	2026-04-05 00:07:09.367681+00	11111111-1111-1111-1111-111111111111
292	43	venta	Venta FAC-20260404-2059 (Efectivo)	200	294	3	2026-04-05 00:18:26.971089+00	11111111-1111-1111-1111-111111111111
293	43	venta	Venta FAC-20260404-8883 (Efectivo)	200	295	3	2026-04-05 00:25:13.612073+00	11111111-1111-1111-1111-111111111111
294	43	venta	Venta FAC-20260404-2079 (Efectivo)	400	296	3	2026-04-05 00:26:16.809972+00	11111111-1111-1111-1111-111111111111
295	43	venta	Venta FAC-20260404-1760 (Efectivo)	200	297	3	2026-04-05 00:26:46.499356+00	11111111-1111-1111-1111-111111111111
296	43	venta	Venta FAC-20260404-1205 (Efectivo)	200	298	3	2026-04-05 00:31:36.053969+00	11111111-1111-1111-1111-111111111111
297	43	venta	Venta FAC-20260404-6881 (Efectivo)	3700	299	3	2026-04-05 00:40:33.082322+00	11111111-1111-1111-1111-111111111111
298	43	venta	Venta FAC-20260404-8376 (Efectivo)	200	300	3	2026-04-05 00:43:43.770015+00	11111111-1111-1111-1111-111111111111
299	43	venta	Venta FAC-20260404-1567 (Efectivo)	200	301	3	2026-04-05 00:46:56.293698+00	11111111-1111-1111-1111-111111111111
300	43	venta	Venta FAC-20260404-4814 (Efectivo)	200	302	3	2026-04-05 00:51:09.518177+00	11111111-1111-1111-1111-111111111111
301	43	venta	Venta FAC-20260404-9700 (Efectivo)	400	303	3	2026-04-05 00:53:54.459179+00	11111111-1111-1111-1111-111111111111
302	43	venta	Venta FAC-20260404-2908 (Efectivo)	200	304	3	2026-04-05 00:56:17.631829+00	11111111-1111-1111-1111-111111111111
303	43	venta	Venta FAC-20260404-8082 (Efectivo)	600	305	3	2026-04-05 00:56:43.066816+00	11111111-1111-1111-1111-111111111111
304	43	venta	Venta FAC-20260404-9329 (Efectivo)	200	306	3	2026-04-05 00:57:14.019996+00	11111111-1111-1111-1111-111111111111
305	43	venta	Venta FAC-20260404-2835 (Efectivo)	200	307	3	2026-04-05 01:01:07.50883+00	11111111-1111-1111-1111-111111111111
306	43	venta	Venta FAC-20260404-9481 (Efectivo)	50	308	3	2026-04-05 01:02:34.219109+00	11111111-1111-1111-1111-111111111111
307	43	venta	Venta FAC-20260404-5316 (Efectivo)	400	309	3	2026-04-05 01:09:19.99708+00	11111111-1111-1111-1111-111111111111
308	43	venta	Venta FAC-20260404-3892 (Efectivo)	200	310	3	2026-04-05 01:15:38.952782+00	11111111-1111-1111-1111-111111111111
309	43	venta	Venta FAC-20260404-4787 (Efectivo)	200	311	3	2026-04-05 01:17:19.3922+00	11111111-1111-1111-1111-111111111111
310	43	venta	Venta FAC-20260404-3745 (Efectivo)	200	312	3	2026-04-05 01:19:48.572913+00	11111111-1111-1111-1111-111111111111
311	43	venta	Venta FAC-20260404-9590 (Efectivo)	200	313	3	2026-04-05 01:21:24.268018+00	11111111-1111-1111-1111-111111111111
312	43	venta	Venta FAC-20260404-2328 (Efectivo)	200	314	3	2026-04-05 01:27:57.486292+00	11111111-1111-1111-1111-111111111111
313	43	venta	Venta FAC-20260404-2226 (Efectivo)	200	315	3	2026-04-05 01:28:47.006187+00	11111111-1111-1111-1111-111111111111
314	43	venta	Venta FAC-20260404-4270 (Efectivo)	150	316	3	2026-04-05 01:30:49.002287+00	11111111-1111-1111-1111-111111111111
315	43	venta	Venta FAC-20260404-2456 (Efectivo)	200	317	3	2026-04-05 01:41:27.137849+00	11111111-1111-1111-1111-111111111111
316	43	venta	Venta FAC-20260404-0052 (Efectivo)	400	318	3	2026-04-05 01:41:54.683979+00	11111111-1111-1111-1111-111111111111
317	43	venta	Venta FAC-20260404-8865 (Efectivo)	400	319	3	2026-04-05 01:46:24.201878+00	11111111-1111-1111-1111-111111111111
318	43	venta	Venta FAC-20260404-7205 (Efectivo)	200	320	3	2026-04-05 01:49:11.860859+00	11111111-1111-1111-1111-111111111111
319	43	venta	Venta FAC-20260404-2281 (Efectivo)	150	321	3	2026-04-05 01:50:57.292031+00	11111111-1111-1111-1111-111111111111
320	43	venta	Venta FAC-20260404-5532 (Efectivo)	200	322	3	2026-04-05 01:52:20.221437+00	11111111-1111-1111-1111-111111111111
321	43	venta	Venta FAC-20260404-5640 (Efectivo)	200	323	3	2026-04-05 02:10:30.368186+00	11111111-1111-1111-1111-111111111111
322	43	venta	Venta FAC-20260404-6264 (Efectivo)	200	324	3	2026-04-05 02:11:41.600738+00	11111111-1111-1111-1111-111111111111
323	43	venta	Venta FAC-20260404-8616 (Efectivo)	200	325	3	2026-04-05 02:12:23.205764+00	11111111-1111-1111-1111-111111111111
324	43	venta	Venta FAC-20260404-6417 (Efectivo)	600	326	3	2026-04-05 02:20:51.130009+00	11111111-1111-1111-1111-111111111111
325	43	venta	Venta FAC-20260404-0375 (Efectivo)	400	327	3	2026-04-05 02:23:44.978813+00	11111111-1111-1111-1111-111111111111
326	43	venta	Venta FAC-20260404-0662 (Efectivo)	400	328	3	2026-04-05 02:40:45.312954+00	11111111-1111-1111-1111-111111111111
327	43	venta	Venta FAC-20260404-1000 (Efectivo)	200	329	3	2026-04-05 02:47:35.603595+00	11111111-1111-1111-1111-111111111111
328	43	venta	Venta FAC-20260404-7070 (Efectivo)	200	330	3	2026-04-05 02:50:01.735391+00	11111111-1111-1111-1111-111111111111
329	43	venta	Venta FAC-20260404-3183 (Efectivo)	50	331	3	2026-04-05 02:56:17.98636+00	11111111-1111-1111-1111-111111111111
330	43	venta	Venta FAC-20260404-6361 (Efectivo)	400	332	3	2026-04-05 02:56:40.908946+00	11111111-1111-1111-1111-111111111111
331	43	venta	Venta FAC-20260404-2938 (Efectivo)	200	333	3	2026-04-05 03:03:37.55231+00	11111111-1111-1111-1111-111111111111
332	43	venta	Venta FAC-20260404-6073 (Efectivo)	200	334	3	2026-04-05 03:09:40.608727+00	11111111-1111-1111-1111-111111111111
333	43	venta	Venta FAC-20260404-7516 (Efectivo)	200	335	3	2026-04-05 03:18:22.142737+00	11111111-1111-1111-1111-111111111111
334	43	venta	Venta FAC-20260404-0201 (Efectivo)	200	336	3	2026-04-05 03:24:34.871547+00	11111111-1111-1111-1111-111111111111
335	43	venta	Venta FAC-20260404-9229 (Efectivo)	2450	337	3	2026-04-05 03:25:14.448337+00	11111111-1111-1111-1111-111111111111
336	43	venta	Venta FAC-20260404-9054 (Efectivo)	1400	338	3	2026-04-05 03:32:43.692769+00	11111111-1111-1111-1111-111111111111
337	43	venta	Venta FAC-20260404-6097 (Efectivo)	200	339	3	2026-04-05 03:37:20.678911+00	11111111-1111-1111-1111-111111111111
338	43	venta	Venta FAC-20260404-7366 (Efectivo)	450	340	3	2026-04-05 03:39:32.252072+00	11111111-1111-1111-1111-111111111111
339	43	venta	Venta FAC-20260404-3503 (Efectivo)	200	341	3	2026-04-05 03:40:18.081759+00	11111111-1111-1111-1111-111111111111
340	43	venta	Venta FAC-20260404-3483 (Efectivo)	200	342	3	2026-04-05 03:44:18.805628+00	11111111-1111-1111-1111-111111111111
341	43	venta	Venta FAC-20260404-3861 (Efectivo)	200	343	3	2026-04-05 03:44:38.647248+00	11111111-1111-1111-1111-111111111111
342	43	venta	Venta FAC-20260404-5901 (Efectivo)	600	344	3	2026-04-05 03:52:51.592802+00	11111111-1111-1111-1111-111111111111
343	43	venta	Venta FAC-20260404-4101 (Efectivo)	200	345	3	2026-04-05 03:53:29.203877+00	11111111-1111-1111-1111-111111111111
344	43	venta	Venta FAC-20260404-7921 (Efectivo)	200	346	3	2026-04-05 03:54:32.529305+00	11111111-1111-1111-1111-111111111111
345	43	venta	Venta FAC-20260404-8906 (Efectivo)	200	347	3	2026-04-05 03:55:53.496956+00	11111111-1111-1111-1111-111111111111
346	43	venta	Venta FAC-20260404-1270 (Efectivo)	200	348	3	2026-04-05 03:59:05.750202+00	11111111-1111-1111-1111-111111111111
347	43	venta	Venta FAC-20260404-9695 (Efectivo)	200	349	3	2026-04-05 04:10:04.636911+00	11111111-1111-1111-1111-111111111111
348	43	venta	Venta FAC-20260404-4768 (Efectivo)	150	350	3	2026-04-05 04:10:39.419529+00	11111111-1111-1111-1111-111111111111
349	43	venta	Venta FAC-20260404-2915 (Efectivo)	200	351	3	2026-04-05 04:17:47.435066+00	11111111-1111-1111-1111-111111111111
350	43	venta	Venta FAC-20260404-6410 (Efectivo)	200	352	3	2026-04-05 04:20:01.006185+00	11111111-1111-1111-1111-111111111111
351	43	venta	Venta FAC-20260404-4254 (Efectivo)	200	353	3	2026-04-05 04:27:49.084779+00	11111111-1111-1111-1111-111111111111
352	43	venta	Venta FAC-20260404-3794 (Efectivo)	200	354	3	2026-04-05 04:31:38.31844+00	11111111-1111-1111-1111-111111111111
353	43	venta	Venta FAC-20260404-1117 (Efectivo)	200	355	3	2026-04-05 04:35:35.564767+00	11111111-1111-1111-1111-111111111111
354	43	venta	Venta FAC-20260404-8944 (Efectivo)	600	356	3	2026-04-05 04:39:43.412574+00	11111111-1111-1111-1111-111111111111
355	43	venta	Venta FAC-20260404-6641 (Efectivo)	200	357	3	2026-04-05 04:48:11.138353+00	11111111-1111-1111-1111-111111111111
356	43	venta	Venta FAC-20260404-4043 (Efectivo)	800	358	3	2026-04-05 05:11:29.345199+00	11111111-1111-1111-1111-111111111111
357	43	venta	Venta FAC-20260404-6064 (Efectivo)	50	359	3	2026-04-05 05:32:01.371817+00	11111111-1111-1111-1111-111111111111
358	43	venta	Venta FAC-20260404-1637 (Efectivo)	2000	360	3	2026-04-05 05:42:27.143984+00	11111111-1111-1111-1111-111111111111
359	43	venta	Venta FAC-20260404-8933 (Efectivo)	400	361	3	2026-04-05 05:43:53.399298+00	11111111-1111-1111-1111-111111111111
360	44	venta	Venta FAC-20260405-4564 (Efectivo)	1200	362	3	2026-04-05 23:45:20.692086+00	11111111-1111-1111-1111-111111111111
361	44	venta	Venta FAC-20260405-3145 (Efectivo)	200	363	3	2026-04-06 00:45:19.608754+00	11111111-1111-1111-1111-111111111111
362	44	venta	Venta FAC-20260405-8789 (Efectivo)	200	364	3	2026-04-06 00:49:14.980178+00	11111111-1111-1111-1111-111111111111
363	44	venta	Venta FAC-20260405-6802 (Efectivo)	200	365	3	2026-04-06 01:02:12.766535+00	11111111-1111-1111-1111-111111111111
364	44	venta	Venta FAC-20260405-3398 (Efectivo)	15	366	3	2026-04-06 01:28:29.714923+00	11111111-1111-1111-1111-111111111111
365	44	venta	Venta FAC-20260405-3290 (Efectivo)	400	367	3	2026-04-06 01:59:09.262048+00	11111111-1111-1111-1111-111111111111
366	44	venta	Venta FAC-20260405-7269 (Efectivo)	200	368	3	2026-04-06 02:13:13.635829+00	11111111-1111-1111-1111-111111111111
367	44	venta	Venta FAC-20260405-1890 (Efectivo)	800	369	3	2026-04-06 02:43:57.748421+00	11111111-1111-1111-1111-111111111111
368	45	venta	Venta FAC-20260406-1741 (Efectivo)	50	370	3	2026-04-06 21:20:18.292282+00	11111111-1111-1111-1111-111111111111
369	45	venta	Venta FAC-20260406-1260 (Efectivo)	200	371	3	2026-04-06 23:42:28.165373+00	11111111-1111-1111-1111-111111111111
370	45	venta	Venta FAC-20260406-5798 (Efectivo)	200	372	3	2026-04-06 23:42:41.979806+00	11111111-1111-1111-1111-111111111111
371	45	venta	Venta FAC-20260406-5653 (Efectivo)	200	373	3	2026-04-07 00:00:22.188508+00	11111111-1111-1111-1111-111111111111
372	45	venta	Venta FAC-20260406-0788 (Efectivo)	200	374	3	2026-04-07 00:09:27.381733+00	11111111-1111-1111-1111-111111111111
373	45	venta	Venta FAC-20260406-4948 (Efectivo)	200	375	3	2026-04-07 00:16:41.445244+00	11111111-1111-1111-1111-111111111111
374	45	venta	Venta FAC-20260406-4585 (Efectivo)	200	376	3	2026-04-07 00:29:31.210557+00	11111111-1111-1111-1111-111111111111
375	45	venta	Venta FAC-20260406-1042 (Efectivo)	200	377	3	2026-04-07 00:39:57.464793+00	11111111-1111-1111-1111-111111111111
376	45	venta	Venta FAC-20260406-2968 (Efectivo)	200	378	3	2026-04-07 01:12:09.772017+00	11111111-1111-1111-1111-111111111111
377	45	venta	Venta FAC-20260406-8569 (Efectivo)	200	379	3	2026-04-07 01:35:05.376684+00	11111111-1111-1111-1111-111111111111
378	45	venta	Venta FAC-20260406-6994 (Efectivo)	200	380	3	2026-04-07 01:48:23.394631+00	11111111-1111-1111-1111-111111111111
379	45	venta	Venta FAC-20260406-0285 (Efectivo)	400	381	3	2026-04-07 02:15:16.866186+00	11111111-1111-1111-1111-111111111111
380	45	venta	Venta FAC-20260406-8021 (Efectivo)	200	382	3	2026-04-07 02:34:04.433526+00	11111111-1111-1111-1111-111111111111
381	45	venta	Venta FAC-20260406-9829 (Efectivo)	200	383	3	2026-04-07 02:34:05.828465+00	11111111-1111-1111-1111-111111111111
382	45	venta	Venta FAC-20260406-5917 (Efectivo)	400	384	3	2026-04-07 03:08:22.331978+00	11111111-1111-1111-1111-111111111111
383	45	venta	Venta FAC-20260406-3830 (Efectivo)	200	385	3	2026-04-07 03:08:39.819003+00	11111111-1111-1111-1111-111111111111
384	45	venta	Venta FAC-20260406-0791 (Efectivo)	200	386	3	2026-04-07 03:09:07.147666+00	11111111-1111-1111-1111-111111111111
385	45	venta	Venta FAC-20260406-9434 (Efectivo)	200	387	3	2026-04-07 03:22:06.315316+00	11111111-1111-1111-1111-111111111111
386	45	venta	Venta FAC-20260406-9241 (Efectivo)	200	388	3	2026-04-07 03:34:45.253126+00	11111111-1111-1111-1111-111111111111
387	46	venta	Venta FAC-20260408-8709 (Efectivo)	400	389	3	2026-04-09 00:32:16.530361+00	11111111-1111-1111-1111-111111111111
388	46	venta	Venta FAC-20260408-2995 (Efectivo)	200	390	3	2026-04-09 00:43:30.119881+00	11111111-1111-1111-1111-111111111111
389	46	venta	Venta FAC-20260408-7547 (Efectivo)	200	391	3	2026-04-09 00:44:25.179003+00	11111111-1111-1111-1111-111111111111
390	46	venta	Venta FAC-20260408-9405 (Efectivo)	200	392	3	2026-04-09 00:57:17.029772+00	11111111-1111-1111-1111-111111111111
391	46	venta	Venta FAC-20260408-0910 (Efectivo)	200	393	3	2026-04-09 00:57:47.909187+00	11111111-1111-1111-1111-111111111111
392	46	venta	Venta FAC-20260408-8978 (Efectivo)	1400	394	3	2026-04-09 01:15:57.06053+00	11111111-1111-1111-1111-111111111111
393	46	venta	Venta FAC-20260408-7191 (Efectivo)	200	395	3	2026-04-09 01:17:44.409511+00	11111111-1111-1111-1111-111111111111
394	46	venta	Venta FAC-20260408-3174 (Efectivo)	300	396	3	2026-04-09 01:24:10.831721+00	11111111-1111-1111-1111-111111111111
395	46	venta	Venta FAC-20260408-3163 (Efectivo)	200	397	3	2026-04-09 01:50:40.662803+00	11111111-1111-1111-1111-111111111111
396	46	venta	Venta FAC-20260408-6776 (Efectivo)	400	398	3	2026-04-09 02:17:44.687792+00	11111111-1111-1111-1111-111111111111
397	46	venta	Venta FAC-20260408-5658 (Efectivo)	200	399	3	2026-04-09 02:40:03.108603+00	11111111-1111-1111-1111-111111111111
398	46	venta	Venta FAC-20260408-2804 (Efectivo)	150	400	3	2026-04-09 02:51:50.230855+00	11111111-1111-1111-1111-111111111111
399	46	venta	Venta FAC-20260408-7375 (Efectivo)	1400	401	3	2026-04-09 03:30:24.997459+00	11111111-1111-1111-1111-111111111111
400	46	venta	Venta FAC-20260408-4521 (Efectivo)	200	402	3	2026-04-09 03:34:11.656629+00	11111111-1111-1111-1111-111111111111
401	47	venta	Venta FAC-20260409-1992 (Efectivo)	600	403	3	2026-04-09 22:08:30.817588+00	11111111-1111-1111-1111-111111111111
402	47	venta	Venta FAC-20260409-3692 (Efectivo)	400	404	3	2026-04-09 23:13:02.553178+00	11111111-1111-1111-1111-111111111111
403	47	venta	Venta FAC-20260409-2763 (Efectivo)	200	405	3	2026-04-09 23:35:51.060271+00	11111111-1111-1111-1111-111111111111
404	47	venta	Venta FAC-20260409-8314 (Efectivo)	200	406	3	2026-04-09 23:58:46.674175+00	11111111-1111-1111-1111-111111111111
405	47	venta	Venta FAC-20260409-9177 (Efectivo)	200	407	3	2026-04-10 00:35:18.284825+00	11111111-1111-1111-1111-111111111111
406	47	venta	Venta FAC-20260409-1875 (Efectivo)	150	408	3	2026-04-10 00:38:20.357518+00	11111111-1111-1111-1111-111111111111
407	47	venta	Venta FAC-20260409-9354 (Efectivo)	400	409	3	2026-04-10 00:46:47.643557+00	11111111-1111-1111-1111-111111111111
408	47	venta	Venta FAC-20260409-9423 (Efectivo)	200	410	3	2026-04-10 01:01:08.704596+00	11111111-1111-1111-1111-111111111111
409	47	venta	Venta FAC-20260409-4801 (Efectivo)	400	411	3	2026-04-10 01:06:13.354678+00	11111111-1111-1111-1111-111111111111
410	47	venta	Venta FAC-20260409-3717 (Efectivo)	1000	412	3	2026-04-10 01:26:02.105088+00	11111111-1111-1111-1111-111111111111
411	47	venta	Venta FAC-20260409-9564 (Efectivo)	200	413	3	2026-04-10 01:29:17.738791+00	11111111-1111-1111-1111-111111111111
412	47	venta	Venta FAC-20260409-0966 (Efectivo)	200	414	3	2026-04-10 01:39:19.320617+00	11111111-1111-1111-1111-111111111111
413	47	venta	Venta FAC-20260409-7786 (Efectivo)	200	415	3	2026-04-10 01:51:46.139963+00	11111111-1111-1111-1111-111111111111
414	47	venta	Venta FAC-20260409-9639 (Efectivo)	400	416	3	2026-04-10 02:00:08.071391+00	11111111-1111-1111-1111-111111111111
415	47	venta	Venta FAC-20260409-9156 (Efectivo)	200	417	3	2026-04-10 02:17:17.968834+00	11111111-1111-1111-1111-111111111111
416	47	venta	Venta FAC-20260409-0295 (Efectivo)	200	418	3	2026-04-10 02:31:08.489067+00	11111111-1111-1111-1111-111111111111
417	47	venta	Venta FAC-20260409-0474 (Efectivo)	200	419	3	2026-04-10 02:45:49.073867+00	11111111-1111-1111-1111-111111111111
418	47	venta	Venta FAC-20260409-0950 (Efectivo)	200	420	3	2026-04-10 02:53:59.314189+00	11111111-1111-1111-1111-111111111111
419	48	venta	Venta FAC-20260410-7414 (Efectivo)	200	421	3	2026-04-10 21:29:17.991075+00	11111111-1111-1111-1111-111111111111
420	48	venta	Venta FAC-20260410-4266 (Efectivo)	200	422	3	2026-04-10 22:20:34.184639+00	11111111-1111-1111-1111-111111111111
421	48	venta	Venta FAC-20260410-7712 (Efectivo)	400	423	3	2026-04-10 22:47:57.750178+00	11111111-1111-1111-1111-111111111111
422	48	venta	Venta FAC-20260410-0164 (Efectivo)	600	424	3	2026-04-11 00:16:10.657052+00	11111111-1111-1111-1111-111111111111
423	48	venta	Venta FAC-20260410-8757 (Efectivo)	200	425	3	2026-04-11 00:20:58.773113+00	11111111-1111-1111-1111-111111111111
424	48	venta	Venta FAC-20260410-3160 (Efectivo)	200	426	3	2026-04-11 00:41:13.415688+00	11111111-1111-1111-1111-111111111111
425	48	venta	Venta FAC-20260410-7907 (Efectivo)	200	427	3	2026-04-11 00:44:58.386641+00	11111111-1111-1111-1111-111111111111
426	48	venta	Venta FAC-20260410-3083 (Efectivo)	50	428	3	2026-04-11 00:52:33.325958+00	11111111-1111-1111-1111-111111111111
427	48	venta	Venta FAC-20260410-1833 (Efectivo)	50	429	3	2026-04-11 00:55:21.841409+00	11111111-1111-1111-1111-111111111111
428	48	venta	Venta FAC-20260410-6276 (Efectivo)	400	430	3	2026-04-11 01:09:46.480425+00	11111111-1111-1111-1111-111111111111
429	48	venta	Venta FAC-20260410-9807 (Efectivo)	200	431	3	2026-04-11 01:14:09.717152+00	11111111-1111-1111-1111-111111111111
430	48	venta	Venta FAC-20260410-4915 (Efectivo)	400	432	3	2026-04-11 01:20:35.135527+00	11111111-1111-1111-1111-111111111111
431	48	venta	Venta FAC-20260410-2770 (Efectivo)	225	433	3	2026-04-11 01:22:02.694459+00	11111111-1111-1111-1111-111111111111
432	48	venta	Venta FAC-20260410-0050 (Efectivo)	200	434	3	2026-04-11 01:22:49.927193+00	11111111-1111-1111-1111-111111111111
433	48	venta	Venta FAC-20260410-3462 (Efectivo)	600	435	3	2026-04-11 01:23:43.387063+00	11111111-1111-1111-1111-111111111111
434	48	venta	Venta FAC-20260410-2710 (Efectivo)	200	436	3	2026-04-11 01:31:13.323654+00	11111111-1111-1111-1111-111111111111
435	48	venta	Venta FAC-20260410-9512 (Efectivo)	200	437	3	2026-04-11 01:32:19.404896+00	11111111-1111-1111-1111-111111111111
436	48	venta	Venta FAC-20260410-4703 (Efectivo)	200	438	3	2026-04-11 01:42:34.511199+00	11111111-1111-1111-1111-111111111111
437	48	venta	Venta FAC-20260410-2794 (Efectivo)	200	439	3	2026-04-11 01:56:03.262408+00	11111111-1111-1111-1111-111111111111
438	48	venta	Venta FAC-20260410-3832 (Efectivo)	200	440	3	2026-04-11 01:58:43.770153+00	11111111-1111-1111-1111-111111111111
439	48	venta	Venta FAC-20260410-0542 (Efectivo)	200	441	3	2026-04-11 02:21:40.421062+00	11111111-1111-1111-1111-111111111111
440	48	venta	Venta FAC-20260410-8815 (Efectivo)	200	442	3	2026-04-11 02:33:19.165567+00	11111111-1111-1111-1111-111111111111
441	48	venta	Venta FAC-20260410-7760 (Efectivo)	400	443	3	2026-04-11 02:38:17.946609+00	11111111-1111-1111-1111-111111111111
442	48	venta	Venta FAC-20260410-6602 (Efectivo)	200	444	3	2026-04-11 03:01:06.868999+00	11111111-1111-1111-1111-111111111111
443	48	venta	Venta FAC-20260410-0350 (Efectivo)	200	445	3	2026-04-11 03:11:20.491198+00	11111111-1111-1111-1111-111111111111
444	48	venta	Venta FAC-20260410-0739 (Efectivo)	200	446	3	2026-04-11 03:11:20.618923+00	11111111-1111-1111-1111-111111111111
445	48	venta	Venta FAC-20260410-0697 (Efectivo)	200	447	3	2026-04-11 03:53:20.644667+00	11111111-1111-1111-1111-111111111111
446	48	venta	Venta FAC-20260410-1022 (Efectivo)	400	448	3	2026-04-11 03:54:30.769779+00	11111111-1111-1111-1111-111111111111
447	49	venta	Venta FAC-20260411-8837 (Efectivo)	200	449	3	2026-04-11 20:33:50.387321+00	11111111-1111-1111-1111-111111111111
448	49	venta	Venta FAC-20260411-4060 (Efectivo)	200	450	3	2026-04-11 20:49:05.064043+00	11111111-1111-1111-1111-111111111111
449	49	venta	Venta FAC-20260411-6724 (Efectivo)	200	451	3	2026-04-11 20:56:17.946539+00	11111111-1111-1111-1111-111111111111
450	49	venta	Venta FAC-20260411-7184 (Efectivo)	200	452	3	2026-04-11 21:00:08.159477+00	11111111-1111-1111-1111-111111111111
451	49	venta	Venta FAC-20260411-6014 (Efectivo)	200	453	3	2026-04-11 21:03:36.978342+00	11111111-1111-1111-1111-111111111111
452	49	venta	Venta FAC-20260411-1627 (Efectivo)	200	454	3	2026-04-11 21:05:52.882327+00	11111111-1111-1111-1111-111111111111
453	49	venta	Venta FAC-20260411-2552 (Efectivo)	200	455	3	2026-04-11 21:09:03.677803+00	11111111-1111-1111-1111-111111111111
454	49	venta	Venta FAC-20260411-4245 (Efectivo)	200	456	3	2026-04-11 21:09:05.152194+00	11111111-1111-1111-1111-111111111111
455	49	venta	Venta FAC-20260411-8319 (Efectivo)	200	457	3	2026-04-11 21:10:19.242896+00	11111111-1111-1111-1111-111111111111
456	49	venta	Venta FAC-20260411-5092 (Efectivo)	30	458	3	2026-04-11 21:12:46.041563+00	11111111-1111-1111-1111-111111111111
457	49	venta	Venta FAC-20260411-7185 (Efectivo)	200	459	3	2026-04-11 21:14:28.083756+00	11111111-1111-1111-1111-111111111111
458	49	venta	Venta FAC-20260411-0732 (Efectivo)	200	460	3	2026-04-11 21:21:01.83745+00	11111111-1111-1111-1111-111111111111
459	49	venta	Venta FAC-20260411-8272 (Efectivo)	200	461	3	2026-04-11 21:31:19.327463+00	11111111-1111-1111-1111-111111111111
460	49	venta	Venta FAC-20260411-7215 (Efectivo)	200	462	3	2026-04-11 21:32:28.114653+00	11111111-1111-1111-1111-111111111111
461	49	venta	Venta FAC-20260411-6630 (Efectivo)	50	463	3	2026-04-11 21:40:57.716282+00	11111111-1111-1111-1111-111111111111
462	49	venta	Venta FAC-20260411-4356 (Efectivo)	200	464	3	2026-04-11 21:41:25.97186+00	11111111-1111-1111-1111-111111111111
463	49	venta	Venta FAC-20260411-6371 (Efectivo)	200	465	3	2026-04-11 21:42:47.685083+00	11111111-1111-1111-1111-111111111111
464	49	venta	Venta FAC-20260411-4124 (Efectivo)	200	466	3	2026-04-11 21:46:15.000822+00	11111111-1111-1111-1111-111111111111
465	49	venta	Venta FAC-20260411-6351 (Efectivo)	200	467	3	2026-04-11 21:47:27.230692+00	11111111-1111-1111-1111-111111111111
466	49	venta	Venta FAC-20260411-7604 (Efectivo)	200	468	3	2026-04-11 21:57:48.524382+00	11111111-1111-1111-1111-111111111111
467	49	venta	Venta FAC-20260411-3898 (Efectivo)	600	469	3	2026-04-11 21:59:04.702267+00	11111111-1111-1111-1111-111111111111
468	49	venta	Venta FAC-20260411-6062 (Efectivo)	200	470	3	2026-04-11 22:02:16.862854+00	11111111-1111-1111-1111-111111111111
469	49	venta	Venta FAC-20260411-9147 (Efectivo)	200	471	3	2026-04-11 22:19:30.185948+00	11111111-1111-1111-1111-111111111111
470	49	venta	Venta FAC-20260411-0755 (Efectivo)	200	472	3	2026-04-11 22:38:52.169383+00	11111111-1111-1111-1111-111111111111
471	49	venta	Venta FAC-20260411-3205 (Efectivo)	200	473	3	2026-04-11 23:00:34.143564+00	11111111-1111-1111-1111-111111111111
472	49	venta	Venta FAC-20260411-4423 (Efectivo)	200	474	3	2026-04-11 23:15:05.770194+00	11111111-1111-1111-1111-111111111111
473	49	venta	Venta FAC-20260411-5838 (Efectivo)	200	475	3	2026-04-11 23:20:16.945764+00	11111111-1111-1111-1111-111111111111
474	49	venta	Venta FAC-20260411-7288 (Efectivo)	200	476	3	2026-04-11 23:22:58.255263+00	11111111-1111-1111-1111-111111111111
475	49	venta	Venta FAC-20260411-3752 (Efectivo)	200	477	3	2026-04-11 23:35:35.077897+00	11111111-1111-1111-1111-111111111111
476	49	venta	Venta FAC-20260411-8155 (Efectivo)	400	478	3	2026-04-11 23:40:38.905757+00	11111111-1111-1111-1111-111111111111
477	49	venta	Venta FAC-20260411-9700 (Efectivo)	200	479	3	2026-04-11 23:42:20.412571+00	11111111-1111-1111-1111-111111111111
478	49	venta	Venta FAC-20260411-2577 (Efectivo)	200	480	3	2026-04-11 23:42:43.28819+00	11111111-1111-1111-1111-111111111111
479	49	venta	Venta FAC-20260411-9901 (Efectivo)	400	481	3	2026-04-11 23:57:30.694381+00	11111111-1111-1111-1111-111111111111
480	49	venta	Venta FAC-20260411-8740 (Efectivo)	400	482	3	2026-04-11 23:58:49.501867+00	11111111-1111-1111-1111-111111111111
481	49	venta	Venta FAC-20260411-7264 (Efectivo)	600	483	3	2026-04-12 00:13:18.437151+00	11111111-1111-1111-1111-111111111111
482	49	venta	Venta FAC-20260411-7749 (Efectivo)	200	484	3	2026-04-12 00:15:09.305659+00	11111111-1111-1111-1111-111111111111
483	49	venta	Venta FAC-20260411-4929 (Efectivo)	1900	485	3	2026-04-12 00:43:17.964191+00	11111111-1111-1111-1111-111111111111
484	50	venta	Venta FAC-20260412-9481 (Efectivo)	200	486	3	2026-04-12 20:27:40.888931+00	11111111-1111-1111-1111-111111111111
485	50	venta	Venta FAC-20260412-5756 (Efectivo)	200	487	3	2026-04-12 20:38:37.09848+00	11111111-1111-1111-1111-111111111111
486	50	venta	Venta FAC-20260412-5240 (Efectivo)	200	488	3	2026-04-12 20:41:16.494358+00	11111111-1111-1111-1111-111111111111
487	50	venta	Venta FAC-20260412-8011 (Efectivo)	400	489	3	2026-04-12 20:57:49.378935+00	11111111-1111-1111-1111-111111111111
488	50	venta	Venta FAC-20260412-3833 (Efectivo)	200	490	3	2026-04-12 21:17:35.374281+00	11111111-1111-1111-1111-111111111111
489	50	venta	Venta FAC-20260412-6052 (Efectivo)	200	491	3	2026-04-12 21:22:47.516309+00	11111111-1111-1111-1111-111111111111
490	50	venta	Venta FAC-20260412-9731 (Efectivo)	600	492	3	2026-04-12 21:27:01.302992+00	11111111-1111-1111-1111-111111111111
491	50	venta	Venta FAC-20260412-0522 (Efectivo)	200	493	3	2026-04-12 21:29:41.826486+00	11111111-1111-1111-1111-111111111111
492	50	venta	Venta FAC-20260412-7751 (Efectivo)	400	494	3	2026-04-12 21:30:39.331581+00	11111111-1111-1111-1111-111111111111
493	50	venta	Venta FAC-20260412-7325 (Efectivo)	200	495	3	2026-04-12 21:35:49.187108+00	11111111-1111-1111-1111-111111111111
494	50	venta	Venta FAC-20260412-3762 (Efectivo)	200	496	3	2026-04-12 21:39:04.976564+00	11111111-1111-1111-1111-111111111111
495	50	venta	Venta FAC-20260412-4404 (Efectivo)	200	497	3	2026-04-12 22:01:46.118455+00	11111111-1111-1111-1111-111111111111
496	50	venta	Venta FAC-20260412-5157 (Efectivo)	200	498	3	2026-04-12 22:01:46.433295+00	11111111-1111-1111-1111-111111111111
497	50	venta	Venta FAC-20260412-8394 (Efectivo)	400	499	3	2026-04-12 22:08:40.22109+00	11111111-1111-1111-1111-111111111111
498	50	venta	Venta FAC-20260412-5855 (Efectivo)	200	500	3	2026-04-12 22:14:07.037593+00	11111111-1111-1111-1111-111111111111
499	50	venta	Venta FAC-20260412-3655 (Efectivo)	200	501	3	2026-04-12 22:19:24.931797+00	11111111-1111-1111-1111-111111111111
500	50	venta	Venta FAC-20260412-9259 (Efectivo)	200	502	3	2026-04-12 22:20:40.493823+00	11111111-1111-1111-1111-111111111111
501	50	venta	Venta FAC-20260412-0418 (Efectivo)	350	503	3	2026-04-12 22:27:52.003059+00	11111111-1111-1111-1111-111111111111
502	50	venta	Venta FAC-20260412-8318 (Efectivo)	200	504	3	2026-04-12 22:40:40.294925+00	11111111-1111-1111-1111-111111111111
503	50	venta	Venta FAC-20260412-4146 (Efectivo)	200	505	3	2026-04-12 22:49:15.688869+00	11111111-1111-1111-1111-111111111111
504	50	venta	Venta FAC-20260412-9973 (Efectivo)	200	506	3	2026-04-12 22:49:51.64974+00	11111111-1111-1111-1111-111111111111
505	50	venta	Venta FAC-20260412-8092 (Efectivo)	1215	507	3	2026-04-12 22:58:00.563841+00	11111111-1111-1111-1111-111111111111
506	50	venta	Venta FAC-20260412-6156 (Efectivo)	600	508	3	2026-04-12 22:59:17.634088+00	11111111-1111-1111-1111-111111111111
507	50	venta	Venta FAC-20260412-4452 (Efectivo)	200	509	3	2026-04-12 23:16:16.176789+00	11111111-1111-1111-1111-111111111111
508	50	venta	Venta FAC-20260412-5984 (Efectivo)	200	510	3	2026-04-12 23:16:17.112939+00	11111111-1111-1111-1111-111111111111
509	50	venta	Venta FAC-20260412-3196 (Efectivo)	200	511	3	2026-04-12 23:26:15.032347+00	11111111-1111-1111-1111-111111111111
510	50	venta	Venta FAC-20260412-3284 (Efectivo)	200	512	3	2026-04-12 23:29:14.726407+00	11111111-1111-1111-1111-111111111111
511	50	venta	Venta FAC-20260412-6033 (Efectivo)	200	513	3	2026-04-12 23:33:07.98328+00	11111111-1111-1111-1111-111111111111
512	50	venta	Venta FAC-20260412-0745 (Efectivo)	200	514	3	2026-04-12 23:33:52.107352+00	11111111-1111-1111-1111-111111111111
513	50	venta	Venta FAC-20260412-8805 (Efectivo)	200	515	3	2026-04-12 23:42:10.06349+00	11111111-1111-1111-1111-111111111111
514	50	venta	Venta FAC-20260412-9843 (Efectivo)	200	516	3	2026-04-12 23:42:51.027209+00	11111111-1111-1111-1111-111111111111
515	50	venta	Venta FAC-20260412-8275 (Efectivo)	400	517	3	2026-04-12 23:44:49.739297+00	11111111-1111-1111-1111-111111111111
516	50	venta	Venta FAC-20260412-7908 (Efectivo)	100	518	3	2026-04-12 23:46:49.190912+00	11111111-1111-1111-1111-111111111111
517	50	venta	Venta FAC-20260412-0433 (Efectivo)	400	519	3	2026-04-12 23:48:41.976586+00	11111111-1111-1111-1111-111111111111
518	50	venta	Venta FAC-20260412-3576 (Efectivo)	200	520	3	2026-04-13 00:14:55.403423+00	11111111-1111-1111-1111-111111111111
519	50	venta	Venta FAC-20260412-6905 (Efectivo)	200	521	3	2026-04-13 00:28:08.583867+00	11111111-1111-1111-1111-111111111111
520	50	venta	Venta FAC-20260412-6723 (Efectivo)	200	522	3	2026-04-13 00:33:27.972677+00	11111111-1111-1111-1111-111111111111
521	50	venta	Venta FAC-20260412-0546 (Efectivo)	200	523	3	2026-04-13 00:36:21.72442+00	11111111-1111-1111-1111-111111111111
522	50	venta	Venta FAC-20260412-0917 (Efectivo)	150	524	3	2026-04-13 00:39:52.050547+00	11111111-1111-1111-1111-111111111111
523	50	venta	Venta FAC-20260412-0733 (Efectivo)	700	525	3	2026-04-13 00:42:32.507935+00	11111111-1111-1111-1111-111111111111
524	50	venta	Venta FAC-20260412-2647 (Efectivo)	200	526	3	2026-04-13 00:43:24.116998+00	11111111-1111-1111-1111-111111111111
525	50	venta	Venta FAC-20260412-0651 (Efectivo)	200	527	3	2026-04-13 00:47:51.718386+00	11111111-1111-1111-1111-111111111111
526	50	venta	Venta FAC-20260412-7578 (Efectivo)	200	528	3	2026-04-13 00:49:08.711981+00	11111111-1111-1111-1111-111111111111
527	50	venta	Venta FAC-20260412-0721 (Efectivo)	200	529	3	2026-04-13 00:54:41.853669+00	11111111-1111-1111-1111-111111111111
528	50	venta	Venta FAC-20260412-6637 (Efectivo)	200	530	3	2026-04-13 00:58:17.937167+00	11111111-1111-1111-1111-111111111111
529	50	venta	Venta FAC-20260412-6974 (Efectivo)	200	531	3	2026-04-13 01:00:28.179937+00	11111111-1111-1111-1111-111111111111
530	50	venta	Venta FAC-20260412-7033 (Efectivo)	300	532	3	2026-04-13 01:02:29.3642+00	11111111-1111-1111-1111-111111111111
531	50	venta	Venta FAC-20260412-9691 (Efectivo)	300	533	3	2026-04-13 01:02:31.188599+00	11111111-1111-1111-1111-111111111111
532	50	venta	Venta FAC-20260412-2021 (Efectivo)	200	534	3	2026-04-13 01:04:13.125789+00	11111111-1111-1111-1111-111111111111
533	50	venta	Venta FAC-20260412-3267 (Efectivo)	200	535	3	2026-04-13 01:04:14.313076+00	11111111-1111-1111-1111-111111111111
534	50	venta	Venta FAC-20260412-1724 (Efectivo)	150	536	3	2026-04-13 01:05:42.840095+00	11111111-1111-1111-1111-111111111111
535	50	venta	Venta FAC-20260412-4683 (Efectivo)	60	537	3	2026-04-13 01:10:45.890726+00	11111111-1111-1111-1111-111111111111
536	50	venta	Venta FAC-20260412-0396 (Efectivo)	200	538	3	2026-04-13 01:23:32.123822+00	11111111-1111-1111-1111-111111111111
537	50	venta	Venta FAC-20260412-1976 (Efectivo)	200	539	3	2026-04-13 01:23:33.211637+00	11111111-1111-1111-1111-111111111111
538	50	venta	Venta FAC-20260412-5757 (Efectivo)	150	540	3	2026-04-13 01:29:27.380704+00	11111111-1111-1111-1111-111111111111
539	50	venta	Venta FAC-20260412-5213 (Efectivo)	200	542	3	2026-04-13 01:37:16.268561+00	11111111-1111-1111-1111-111111111111
540	50	venta	Venta FAC-20260412-7347 (Efectivo)	200	543	3	2026-04-13 01:42:38.820823+00	11111111-1111-1111-1111-111111111111
541	50	venta	Venta FAC-20260412-8198 (Efectivo)	200	544	3	2026-04-13 01:42:39.213577+00	11111111-1111-1111-1111-111111111111
542	50	venta	Venta FAC-20260412-8305 (Efectivo)	200	545	3	2026-04-13 01:43:59.557255+00	11111111-1111-1111-1111-111111111111
543	50	venta	Venta FAC-20260412-0657 (Efectivo)	500	546	3	2026-04-13 01:45:02.171006+00	11111111-1111-1111-1111-111111111111
544	50	venta	Venta FAC-20260412-0660 (Efectivo)	150	547	3	2026-04-13 01:51:52.118198+00	11111111-1111-1111-1111-111111111111
545	50	venta	Venta FAC-20260412-8911 (Efectivo)	1200	548	3	2026-04-13 01:57:10.24774+00	11111111-1111-1111-1111-111111111111
546	50	venta	Venta FAC-20260412-8817 (Efectivo)	1200	549	3	2026-04-13 01:58:09.813176+00	11111111-1111-1111-1111-111111111111
547	50	venta	Venta FAC-20260412-6392 (Efectivo)	30	550	3	2026-04-13 02:08:57.491485+00	11111111-1111-1111-1111-111111111111
548	50	venta	Venta FAC-20260412-4242 (Efectivo)	400	551	3	2026-04-13 02:21:25.73989+00	11111111-1111-1111-1111-111111111111
549	50	venta	Venta FAC-20260412-0801 (Efectivo)	300	552	3	2026-04-13 02:23:01.837922+00	11111111-1111-1111-1111-111111111111
550	50	venta	Venta FAC-20260412-2685 (Efectivo)	30	553	3	2026-04-13 02:23:33.756702+00	11111111-1111-1111-1111-111111111111
551	50	venta	Venta FAC-20260412-1445 (Efectivo)	350	554	3	2026-04-13 02:52:03.111388+00	11111111-1111-1111-1111-111111111111
552	50	venta	Venta FAC-20260412-8525 (Efectivo)	200	555	3	2026-04-13 02:56:59.588881+00	11111111-1111-1111-1111-111111111111
553	50	venta	Venta FAC-20260412-5510 (Efectivo)	400	556	3	2026-04-13 03:11:26.603271+00	11111111-1111-1111-1111-111111111111
554	50	venta	Venta FAC-20260412-3850 (Efectivo)	600	557	3	2026-04-13 03:20:14.809257+00	11111111-1111-1111-1111-111111111111
555	50	venta	Venta FAC-20260412-6292 (Efectivo)	400	558	3	2026-04-13 03:21:07.621898+00	11111111-1111-1111-1111-111111111111
556	50	venta	Venta FAC-20260412-8149 (Efectivo)	600	559	3	2026-04-13 03:29:29.310506+00	11111111-1111-1111-1111-111111111111
557	50	venta	Venta FAC-20260412-2422 (Efectivo)	500	560	3	2026-04-13 03:33:53.686745+00	11111111-1111-1111-1111-111111111111
558	51	venta	Venta FAC-20260413-1535 (Efectivo)	200	561	3	2026-04-13 21:50:35.260883+00	11111111-1111-1111-1111-111111111111
559	51	venta	Venta FAC-20260413-2599 (Efectivo)	400	562	3	2026-04-13 22:35:25.589241+00	11111111-1111-1111-1111-111111111111
560	51	venta	Venta FAC-20260413-0075 (Efectivo)	200	563	3	2026-04-14 00:16:03.093729+00	11111111-1111-1111-1111-111111111111
561	51	venta	Venta FAC-20260413-0722 (Efectivo)	200	564	3	2026-04-14 01:11:24.358401+00	11111111-1111-1111-1111-111111111111
562	51	venta	Venta FAC-20260413-8675 (Efectivo)	600	565	3	2026-04-14 01:13:51.731568+00	11111111-1111-1111-1111-111111111111
563	51	venta	Venta FAC-20260414-2611 (Efectivo)	200	566	3	2026-04-14 23:20:17.035516+00	11111111-1111-1111-1111-111111111111
564	51	venta	Venta FAC-20260414-9746 (Efectivo)	250	567	3	2026-04-15 00:26:04.668969+00	11111111-1111-1111-1111-111111111111
565	51	venta	Venta FAC-20260414-4722 (Efectivo)	200	568	3	2026-04-15 01:43:08.601998+00	11111111-1111-1111-1111-111111111111
566	51	venta	Venta FAC-20260414-0544 (Efectivo)	400	569	3	2026-04-15 03:12:04.77583+00	11111111-1111-1111-1111-111111111111
567	51	venta	Venta FAC-20260414-8682 (Efectivo)	1100	570	3	2026-04-15 03:38:03.25583+00	11111111-1111-1111-1111-111111111111
568	51	venta	Venta FAC-20260414-6396 (Efectivo)	850	571	3	2026-04-15 03:38:40.800971+00	11111111-1111-1111-1111-111111111111
569	51	venta	Venta FAC-20260414-9681 (Efectivo)	1200	572	3	2026-04-15 03:40:53.361488+00	11111111-1111-1111-1111-111111111111
570	51	venta	Venta FAC-20260414-6068 (Efectivo)	200	573	3	2026-04-15 03:41:09.793702+00	11111111-1111-1111-1111-111111111111
571	52	venta	Venta FAC-20260415-4343 (Efectivo)	800	574	3	2026-04-15 22:38:09.596612+00	11111111-1111-1111-1111-111111111111
572	52	venta	Venta FAC-20260415-0115 (Efectivo)	600	575	3	2026-04-16 03:16:35.028553+00	11111111-1111-1111-1111-111111111111
573	52	venta	Venta FAC-20260415-4953 (Efectivo)	800	576	3	2026-04-16 03:22:00.59464+00	11111111-1111-1111-1111-111111111111
574	52	venta	Venta FAC-20260415-7142 (Efectivo)	200	577	3	2026-04-16 03:26:22.060631+00	11111111-1111-1111-1111-111111111111
575	53	venta	Venta FAC-20260416-3940 (Efectivo)	200	578	3	2026-04-16 22:32:59.925597+00	11111111-1111-1111-1111-111111111111
576	53	venta	Venta FAC-20260416-2453 (Efectivo)	150	579	3	2026-04-16 22:51:18.4524+00	11111111-1111-1111-1111-111111111111
577	53	venta	Venta FAC-20260416-2378 (Efectivo)	200	580	3	2026-04-16 23:00:48.132891+00	11111111-1111-1111-1111-111111111111
578	53	venta	Venta FAC-20260416-9135 (Efectivo)	850	581	3	2026-04-16 23:36:55.88533+00	11111111-1111-1111-1111-111111111111
579	53	venta	Venta FAC-20260416-2955 (Efectivo)	300	582	3	2026-04-16 23:39:28.994284+00	11111111-1111-1111-1111-111111111111
580	53	venta	Venta FAC-20260416-2310 (Efectivo)	600	583	3	2026-04-17 01:41:48.381794+00	11111111-1111-1111-1111-111111111111
581	53	venta	Venta FAC-20260416-8915 (Efectivo)	300	584	3	2026-04-17 02:22:34.746216+00	11111111-1111-1111-1111-111111111111
582	54	venta	Venta FAC-20260417-9993 (Efectivo)	200	585	3	2026-04-17 21:50:46.808441+00	11111111-1111-1111-1111-111111111111
583	54	venta	Venta FAC-20260417-6374 (Efectivo)	400	586	3	2026-04-17 22:38:02.778578+00	11111111-1111-1111-1111-111111111111
584	54	venta	Venta FAC-20260417-0447 (Efectivo)	200	587	3	2026-04-17 22:43:27.755539+00	11111111-1111-1111-1111-111111111111
585	54	venta	Venta FAC-20260417-2638 (Efectivo)	200	588	3	2026-04-17 22:46:09.441547+00	11111111-1111-1111-1111-111111111111
586	54	venta	Venta FAC-20260417-7250 (Efectivo)	600	589	3	2026-04-17 22:55:54.4655+00	11111111-1111-1111-1111-111111111111
587	54	venta	Venta FAC-20260417-7694 (Efectivo)	200	590	3	2026-04-17 23:04:04.10464+00	11111111-1111-1111-1111-111111111111
588	54	venta	Venta FAC-20260417-5850 (Efectivo)	200	591	3	2026-04-17 23:08:12.233762+00	11111111-1111-1111-1111-111111111111
589	54	venta	Venta FAC-20260417-8732 (Efectivo)	200	592	3	2026-04-17 23:20:35.06454+00	11111111-1111-1111-1111-111111111111
590	54	venta	Venta FAC-20260417-1932 (Efectivo)	200	593	3	2026-04-17 23:37:38.405025+00	11111111-1111-1111-1111-111111111111
591	54	venta	Venta FAC-20260417-9034 (Efectivo)	200	594	3	2026-04-17 23:49:25.838334+00	11111111-1111-1111-1111-111111111111
592	54	venta	Venta FAC-20260417-4643 (Efectivo)	225	595	3	2026-04-17 23:54:21.135289+00	11111111-1111-1111-1111-111111111111
593	54	venta	Venta FAC-20260417-5229 (Efectivo)	50	596	3	2026-04-18 00:02:22.223334+00	11111111-1111-1111-1111-111111111111
594	54	venta	Venta FAC-20260417-8358 (Efectivo)	600	597	3	2026-04-18 00:11:44.708971+00	11111111-1111-1111-1111-111111111111
595	54	venta	Venta FAC-20260417-1241 (Efectivo)	200	598	3	2026-04-18 00:16:07.862486+00	11111111-1111-1111-1111-111111111111
596	54	venta	Venta FAC-20260417-7704 (Efectivo)	400	599	3	2026-04-18 00:27:14.137341+00	11111111-1111-1111-1111-111111111111
597	54	venta	Venta FAC-20260417-5316 (Efectivo)	800	600	3	2026-04-18 03:38:52.133013+00	11111111-1111-1111-1111-111111111111
598	54	venta	Venta FAC-20260417-3083 (Efectivo)	100	601	3	2026-04-18 03:40:39.574047+00	11111111-1111-1111-1111-111111111111
599	55	venta	Venta FAC-20260418-9855 (Efectivo)	200	602	3	2026-04-18 21:02:38.760114+00	11111111-1111-1111-1111-111111111111
600	55	venta	Venta FAC-20260418-8247 (Efectivo)	200	603	3	2026-04-18 21:11:56.611125+00	11111111-1111-1111-1111-111111111111
601	55	venta	Venta FAC-20260418-3964 (Efectivo)	200	604	3	2026-04-18 21:59:12.349522+00	11111111-1111-1111-1111-111111111111
602	55	venta	Venta FAC-20260418-4153 (Efectivo)	200	605	3	2026-04-18 22:29:02.223381+00	11111111-1111-1111-1111-111111111111
603	55	venta	Venta FAC-20260418-3908 (Efectivo)	800	606	3	2026-04-18 23:20:32.146974+00	11111111-1111-1111-1111-111111111111
604	55	venta	Venta FAC-20260418-8721 (Efectivo)	200	607	3	2026-04-18 23:56:27.015612+00	11111111-1111-1111-1111-111111111111
605	55	venta	Venta FAC-20260418-1062 (Efectivo)	400	608	3	2026-04-19 01:33:49.121462+00	11111111-1111-1111-1111-111111111111
606	55	venta	Venta FAC-20260418-2751 (Efectivo)	400	609	3	2026-04-19 01:33:50.427277+00	11111111-1111-1111-1111-111111111111
607	55	venta	Venta FAC-20260418-6762 (Efectivo)	200	610	3	2026-04-19 02:03:34.507188+00	11111111-1111-1111-1111-111111111111
608	55	venta	Venta FAC-20260418-3437 (Efectivo)	600	611	3	2026-04-19 02:19:21.49335+00	11111111-1111-1111-1111-111111111111
609	55	venta	Venta FAC-20260418-5973 (Efectivo)	200	612	3	2026-04-19 02:41:54.493091+00	11111111-1111-1111-1111-111111111111
610	55	venta	Venta FAC-20260418-9612 (Efectivo)	150	613	3	2026-04-19 02:54:17.556422+00	11111111-1111-1111-1111-111111111111
611	55	venta	Venta FAC-20260418-2167 (Efectivo)	200	614	3	2026-04-19 02:55:39.84303+00	11111111-1111-1111-1111-111111111111
612	55	venta	Venta FAC-20260418-9940 (Efectivo)	200	615	3	2026-04-19 03:30:28.313684+00	11111111-1111-1111-1111-111111111111
613	56	venta	Venta FAC-20260419-9544 (Efectivo)	400	616	3	2026-04-19 21:17:49.615041+00	11111111-1111-1111-1111-111111111111
614	56	venta	Venta FAC-20260419-1704 (Efectivo)	400	617	3	2026-04-19 21:17:51.094743+00	11111111-1111-1111-1111-111111111111
615	56	venta	Venta FAC-20260419-0475 (Efectivo)	200	618	3	2026-04-19 22:01:49.96039+00	11111111-1111-1111-1111-111111111111
616	56	venta	Venta FAC-20260419-2421 (Efectivo)	200	619	3	2026-04-19 22:17:52.519817+00	11111111-1111-1111-1111-111111111111
617	56	venta	Venta FAC-20260419-0194 (Efectivo)	200	620	3	2026-04-19 23:00:29.507171+00	11111111-1111-1111-1111-111111111111
618	56	venta	Venta FAC-20260419-4777 (Efectivo)	200	621	3	2026-04-19 23:07:44.321279+00	11111111-1111-1111-1111-111111111111
619	56	venta	Venta FAC-20260419-9552 (Efectivo)	200	622	3	2026-04-19 23:29:09.180736+00	11111111-1111-1111-1111-111111111111
620	56	venta	Venta FAC-20260419-3635 (Efectivo)	200	623	3	2026-04-20 01:03:03.068824+00	11111111-1111-1111-1111-111111111111
621	56	venta	Venta FAC-20260419-8805 (Efectivo)	650	624	3	2026-04-20 02:12:18.946456+00	11111111-1111-1111-1111-111111111111
622	58	venta	Venta FAC-20260420-0663 (Efectivo)	200	625	3	2026-04-20 23:26:31.309284+00	11111111-1111-1111-1111-111111111111
623	58	venta	Venta FAC-20260420-3906 (Efectivo)	200	626	3	2026-04-20 23:36:44.297705+00	11111111-1111-1111-1111-111111111111
624	58	venta	Venta FAC-20260420-7829 (Efectivo)	300	627	3	2026-04-20 23:57:48.933323+00	11111111-1111-1111-1111-111111111111
625	58	venta	Venta FAC-20260420-5153 (Efectivo)	200	628	3	2026-04-21 00:34:46.556482+00	11111111-1111-1111-1111-111111111111
626	58	venta	Venta FAC-20260420-6859 (Efectivo)	200	629	3	2026-04-21 00:34:46.941215+00	11111111-1111-1111-1111-111111111111
627	58	venta	Venta FAC-20260420-1976 (Efectivo)	200	630	3	2026-04-21 01:56:02.850036+00	11111111-1111-1111-1111-111111111111
628	58	venta	Venta FAC-20260420-5204 (Efectivo)	200	631	3	2026-04-21 03:18:46.077169+00	11111111-1111-1111-1111-111111111111
640	60	venta	Venta FAC-20260421-8446 (Efectivo)	700	643	3	2026-04-22 03:40:39.813414+00	\N
651	67	venta	Venta FAC-20260424-4105 (Efectivo)	150	665	3	2026-04-24 21:29:31.082559+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
661	67	venta	Venta FAC-20260425-6686 (Efectivo)	3200	675	3	2026-04-25 04:27:11.641902+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
671	68	venta	Venta FAC-20260426-7807 (Efectivo)	150	685	3	2026-04-26 02:18:34.102222+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
681	69	venta	Venta FAC-20260426-3433 (Efectivo)	150	695	3	2026-04-26 23:50:12.292289+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
691	72	venta	Venta FAC-20260501-7746 (Efectivo)	800	704	3	2026-05-01 00:22:34.617758+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
702	74	venta	Venta FAC-20260502-9932 (Efectivo)	900	715	3	2026-05-02 02:15:26.340064+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
714	75	venta	Venta FAC-20260503-2953 (Efectivo)	1250	727	3	2026-05-03 02:37:22.12921+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
724	75	venta	Venta FAC-20260503-9643 (Efectivo)	200	737	3	2026-05-03 04:00:48.222097+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
734	78	venta	Venta FAC-20260505-4333 (Efectivo)	400	747	3	2026-05-05 23:28:52.627394+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
735	78	venta	Venta FAC-20260505-3237 (Efectivo)	400	748	3	2026-05-05 23:28:53.219796+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
749	81	venta	Venta FAC-20260512-1560 (Efectivo)	1000	762	3	2026-05-12 03:20:08.461974+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
\.


--
-- Data for Name: negocios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.negocios (id, nombre, rnc, telefono, direccion, lema, logo_url, email, web, created_at, updated_at, subdominio, plan_tipo, estado_licencia, tipo_negocio, modulos_activos, fecha_vencimiento) FROM stdin;
00000000-0000-0000-0000-000000000000	LogosPOS - Master	\N	\N	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/img_00000000-0000-0000-0000-000000000000_1776865453067.png	\N	\N	2026-04-21 21:51:13.280432+00	2026-04-21 21:51:13.280432+00	admin	pro	activa	general	["ventas", "inventario", "caja", "clientes", "reportes", "usuarios"]	\N
ee860ed4-5d7a-495d-a517-d4a887f9a3f3	Nilays Bar	\N	\N	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/img_ee860ed4-5d7a-495d-a517-d4a887f9a3f3_1776874922384.png	\N	\N	2026-03-28 21:18:01.963375+00	2026-03-28 21:18:01.963375+00	principal	basico	activa	general	["ventas", "inventario", "caja", "clientes", "reportes", "usuarios", "cuentas_cobrar", "roles", "identidad", "sistema", "dashboard", "mesas"]	2027-04-01 00:00:00+00
\.


--
-- Data for Name: pagos_cuentas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagos_cuentas (id, cuenta_id, monto, fecha_pago, metodo_pago, referencia, notas, created_at, negocio_id) FROM stdin;
1	5	200	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:00:06.187862+00	\N
2	5	200	2026-02-25 00:00:00+00	Efectivo	1	\N	2026-02-25 21:00:28.187693+00	\N
3	6	400	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:02:10.242377+00	\N
4	5	200	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:21:51.624453+00	\N
5	5	200	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:22:16.255248+00	\N
6	6	400	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:26:12.223748+00	\N
7	5	200	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:26:34.63313+00	\N
8	5	200	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:27:14.609475+00	\N
9	5	100	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:27:50.088679+00	\N
10	6	400	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:28:03.651535+00	\N
11	5	100	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:32:26.356082+00	\N
12	5	100	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 21:33:01.066692+00	\N
13	8	200	2026-02-25 00:00:00+00	Efectivo	\N	\N	2026-02-25 22:14:57.37926+00	\N
\.


--
-- Data for Name: pagos_cuentas_pagar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagos_cuentas_pagar (id, cuenta_id, monto, fecha_pago, metodo_pago, referencia, notas, created_at, negocio_id) FROM stdin;
\.


--
-- Data for Name: pedidos_mesa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos_mesa (id, mesa_id, usuario_id, cliente_id, estado, total, created_at, updated_at, nombre_cliente, negocio_id) FROM stdin;
1	1	2	\N	finalizado	400	2026-02-24 18:45:16.294677+00	2026-02-24 20:06:04.457+00	Juan	\N
37	4	3	\N	finalizado	1000	2026-03-29 22:06:00.258655+00	2026-03-29 23:38:14.823+00	LA beby	\N
2	1	4	\N	finalizado	400	2026-02-24 20:58:39.344657+00	2026-02-24 20:59:09.667+00	Cris	\N
3	1	3	\N	cancelado	0	2026-02-24 21:38:26.656956+00	2026-02-24 23:20:04.56+00	Cris	\N
4	2	2	\N	cancelado	0	2026-02-24 23:28:39.742991+00	2026-02-24 23:28:46.051+00	2	\N
5	1	3	\N	cancelado	0	2026-03-26 21:33:41.916106+00	2026-03-26 21:33:44.246+00	Elier	\N
23	4	3	\N	finalizado	200	2026-03-29 01:35:02.683517+00	2026-03-29 01:41:32.667+00	El de police negro con trenza	\N
44	12	3	\N	finalizado	1050	2026-03-30 00:41:54.694415+00	2026-03-30 01:30:09.384+00	El Rubio de LA franela negra	\N
6	1	3	\N	cancelado	1000	2026-03-26 21:35:05.528401+00	2026-03-26 21:38:48.146+00	Police azul	\N
7	2	3	\N	cancelado	750	2026-03-26 21:37:04.705518+00	2026-03-26 21:38:57.49+00	Cris	\N
24	4	3	\N	finalizado	200	2026-03-29 01:54:23.567783+00	2026-03-29 01:55:03.32+00	El señor viejo	\N
8	3	2	\N	cancelado	600	2026-03-26 21:44:30.820023+00	2026-03-26 21:47:20.9+00	gjh	\N
40	4	3	\N	finalizado	400	2026-03-29 23:39:46.093349+00	2026-03-29 23:40:48.922+00	Las mellas	\N
9	3	3	\N	cancelado	1350	2026-03-27 14:07:10.492464+00	2026-03-27 14:23:49.211+00	Cris	\N
10	4	3	\N	cancelado	1300	2026-03-27 14:16:08.473146+00	2026-03-27 14:23:53.514+00	Police azul	\N
32	3	3	\N	finalizado	1000	2026-03-29 20:07:37.481958+00	2026-03-29 20:40:12.354+00	El señor del bar de LA camisa roja	\N
11	3	2	\N	cancelado	650	2026-03-27 17:19:57.771607+00	2026-03-27 17:21:14.532+00	1	\N
13	4	3	\N	cancelado	1000	2026-03-28 20:22:26.78916+00	2026-03-28 20:22:33.177+00	Mesa Villar 1 poloche	\N
26	5	3	\N	finalizado	400	2026-03-29 02:16:52.739195+00	2026-03-29 02:19:15.738+00	El muchacho del bar El carbito	\N
22	3	3	\N	finalizado	400	2026-03-29 01:06:18.934909+00	2026-03-29 02:44:52.668+00	Mesa Villar 1 poloche	\N
12	3	3	\N	finalizado	600	2026-03-28 20:20:07.963877+00	2026-03-28 21:40:09.769+00	Cris	\N
14	4	3	\N	finalizado	400	2026-03-28 21:08:59.837002+00	2026-03-28 22:24:58.859+00	El moreno	\N
15	3	3	\N	finalizado	200	2026-03-28 23:59:59.397104+00	2026-03-29 00:14:49.225+00	El señor	\N
16	3	3	\N	finalizado	200	2026-03-29 00:15:57.99408+00	2026-03-29 00:23:27.46+00	El moreno	\N
56	4	3	\N	finalizado	400	2026-03-30 23:52:03.028237+00	2026-03-31 00:25:47.897+00	Las dos jovenes	\N
17	3	3	\N	finalizado	200	2026-03-29 00:25:53.415155+00	2026-03-29 00:37:08.367+00	El del police mamel	\N
42	5	3	\N	cancelado	400	2026-03-30 00:32:30.451366+00	2026-03-30 01:40:54.364+00	LA doña	\N
18	3	3	\N	finalizado	200	2026-03-29 00:38:03.98097+00	2026-03-29 00:41:05.254+00	Mesa Villar 1 poloche	\N
19	3	3	\N	finalizado	400	2026-03-29 00:43:18.677172+00	2026-03-29 00:44:27.92+00	Mesa Villar 1 poloche	\N
28	5	3	\N	finalizado	800	2026-03-29 03:00:41.704109+00	2026-03-29 03:03:39.665+00	Amigo bar	\N
20	3	3	\N	finalizado	200	2026-03-29 00:44:45.419405+00	2026-03-29 00:51:44.382+00	Mesa Villar 1 poloche	\N
35	3	3	\N	finalizado	200	2026-03-29 21:12:34.124099+00	2026-03-29 21:33:09.02+00	El señor de LA gora negra	\N
21	3	3	\N	finalizado	400	2026-03-29 00:52:56.365624+00	2026-03-29 01:05:36.446+00	Mesa Villar 1 poloche	\N
41	4	3	\N	finalizado	1600	2026-03-30 00:15:44.056698+00	2026-03-30 01:42:34.324+00	El señor del Gallo	\N
34	5	3	\N	finalizado	600	2026-03-29 20:58:19.36417+00	2026-03-29 21:39:11.168+00	El señor del bar de LA camisa roja	\N
29	5	3	\N	finalizado	400	2026-03-29 03:05:06.648344+00	2026-03-29 03:27:30.051+00	El señor del poloche rojo	\N
33	4	3	\N	finalizado	1400	2026-03-29 20:30:58.010027+00	2026-03-29 21:49:19.511+00	Ana rosa	\N
27	3	3	\N	finalizado	400	2026-03-29 02:49:58.868061+00	2026-03-29 03:41:00.649+00	Greca semillero	\N
25	4	3	\N	finalizado	700	2026-03-29 02:13:50.519765+00	2026-03-29 04:25:55.307+00	Vecina de arriba	\N
30	5	3	\N	finalizado	600	2026-03-29 03:28:16.734894+00	2026-03-29 04:35:15.974+00	Vero Gen	\N
31	3	3	\N	finalizado	200	2026-03-29 04:22:05.898766+00	2026-03-29 04:56:13.916+00	Critofer	\N
50	4	3	\N	finalizado	200	2026-03-30 03:16:56.231495+00	2026-03-30 03:20:12.707+00	Papito	\N
36	3	3	\N	finalizado	600	2026-03-29 21:52:23.215212+00	2026-03-29 22:43:59.887+00	Frailys	\N
38	5	3	\N	finalizado	200	2026-03-29 22:17:41.310821+00	2026-03-29 22:44:28.373+00	El menor del poloche Verdes limon	\N
49	5	3	\N	finalizado	600	2026-03-30 02:55:58.697664+00	2026-03-30 03:39:25.994+00	LA muchacha de Los lentes del bar	\N
46	4	3	\N	finalizado	200	2026-03-30 01:50:09.667928+00	2026-03-30 02:03:49.182+00	Joven del poloche rojo	\N
47	5	3	\N	finalizado	450	2026-03-30 01:59:24.152907+00	2026-03-30 02:17:50.124+00	El blanquito de LA franela negra	\N
43	13	3	\N	finalizado	600	2026-03-30 00:34:31.897897+00	2026-03-30 01:23:07.802+00	El señor devla gorra negra y el poloche negro	\N
39	3	3	\N	finalizado	600	2026-03-29 23:31:58.127806+00	2026-03-30 01:27:39.279+00	El flakito pelo largo	\N
54	3	3	\N	finalizado	550	2026-03-30 20:55:34.524386+00	2026-03-30 22:19:32.063+00	El viajero del poloche blanco	\N
48	4	3	\N	finalizado	750	2026-03-30 02:52:25.96637+00	2026-03-30 02:58:37.602+00	El Joven del bar del poloche rojo	\N
52	5	3	\N	finalizado	150	2026-03-30 03:54:46.409175+00	2026-03-30 04:15:05.383+00	Muchacha de lo lenses del bar	\N
51	4	3	\N	finalizado	400	2026-03-30 03:53:11.911531+00	2026-03-30 04:16:24.875+00	Ariel	\N
45	3	3	\N	finalizado	200	2026-03-30 01:48:32.531348+00	2026-03-30 04:17:35.508+00	Cristopher	\N
57	5	3	\N	finalizado	1200	2026-03-31 00:02:01.72868+00	2026-03-31 02:48:59.544+00	Abelito	\N
53	3	3	\N	cancelado	750	2026-03-30 04:27:34.661638+00	2026-03-30 04:28:23.635+00	Klk	\N
59	3	3	\N	finalizado	200	2026-03-31 01:41:57.901635+00	2026-03-31 01:58:14.504+00	El señor de LA silla de rueda	\N
58	13	3	\N	finalizado	600	2026-03-31 00:04:21.575329+00	2026-03-31 02:50:24.126+00	Cristofer	\N
68	13	3	\N	finalizado	100	2026-04-01 01:40:39.701029+00	2026-04-01 04:17:21.699+00	El señor de LA gora negra	\N
55	3	3	\N	finalizado	800	2026-03-30 23:41:26.116751+00	2026-03-31 01:26:41.782+00	El Joven de LA tops Negra completa	\N
60	3	3	\N	finalizado	200	2026-03-31 21:37:06.400533+00	2026-03-31 22:06:30.875+00	El señor del frente de LA arena	\N
64	4	3	\N	finalizado	200	2026-03-31 22:40:16.983251+00	2026-03-31 22:42:39.415+00	El ruvito amigo de daniel	\N
61	4	3	\N	finalizado	750	2026-03-31 21:42:49.699067+00	2026-03-31 22:35:09.424+00	El Flaco del bar	\N
63	5	3	\N	finalizado	600	2026-03-31 22:19:24.013355+00	2026-03-31 23:26:47.967+00	El señor del frente el de LA arena	\N
65	4	3	\N	finalizado	400	2026-03-31 23:50:15.111536+00	2026-04-01 00:48:45.636+00	El primo del muchacho del frente de LA arena	\N
66	4	3	\N	finalizado	750	2026-04-01 01:06:35.890688+00	2026-04-01 04:06:53.742+00	El viajero	\N
62	3	3	\N	finalizado	100	2026-03-31 22:07:42.774601+00	2026-04-01 04:17:01.081+00	Cristopher	\N
67	5	3	\N	finalizado	200	2026-04-01 01:38:48.046731+00	2026-04-01 02:43:27.109+00	El juego mesa 2	\N
125	13	3	\N	finalizado	1200	2026-04-05 01:05:36.337505+00	2026-04-05 03:32:40.446+00	Alcanfor mesa de Villar 1	\N
86	4	3	\N	finalizado	200	2026-04-02 01:04:16.018956+00	2026-04-02 01:13:39.607+00	Chelo juego villar Mesa 2	\N
70	1	3	\N	cancelado	400	2026-04-01 01:46:43.467101+00	2026-04-01 01:59:32.258+00	El Joven del poloche rosado	\N
96	3	3	\N	finalizado	200	2026-04-03 00:18:47.862805+00	2026-04-03 00:28:33.461+00	Daniel	\N
69	12	3	\N	finalizado	400	2026-04-01 01:43:01.715385+00	2026-04-01 02:22:02.596+00	Jordanis	\N
100	13	3	\N	finalizado	600	2026-04-03 00:42:58.778022+00	2026-04-03 02:03:06.227+00	El amigo de Cristopher	\N
72	2	3	\N	finalizado	400	2026-04-01 02:06:23.661163+00	2026-04-01 02:35:08.228+00	El chamaco de LA gorra roja del bar	\N
87	4	3	\N	finalizado	200	2026-04-02 01:19:07.263948+00	2026-04-02 01:35:55.506+00	El Gordo Prieto ese	\N
89	4	3	\N	finalizado	200	2026-04-02 01:37:32.204153+00	2026-04-02 01:46:33.112+00	El Gordo Prieto ese juego villar Mesa 2	\N
73	5	3	\N	finalizado	400	2026-04-01 02:52:08.763953+00	2026-04-01 03:07:10.417+00	Caquito amigo	\N
103	2	3	\N	finalizado	1050	2026-04-03 00:50:45.775843+00	2026-04-03 02:04:18.471+00	El Haitiano del bar	\N
75	5	3	\N	finalizado	200	2026-04-01 03:37:12.450032+00	2026-04-01 03:38:05.854+00	Mesa Villar 1 poloche negro Bermuda vernde oscura	\N
71	1	3	\N	finalizado	1200	2026-04-01 01:59:52.381924+00	2026-04-01 04:03:57.844+00	El Joven del poloche rosado	\N
74	12	3	\N	finalizado	200	2026-04-01 03:06:06.353677+00	2026-04-01 04:08:05.534+00	El de Los tatto de LA franela blanca	\N
76	5	3	\N	finalizado	600	2026-04-01 03:47:34.562747+00	2026-04-01 04:11:15.009+00	LA Joven del bar de Los lente	\N
106	4	3	\N	finalizado	200	2026-04-03 01:53:34.119865+00	2026-04-03 02:17:03.805+00	Abelito	\N
77	3	3	\N	finalizado	200	2026-04-01 22:25:58.386238+00	2026-04-01 22:28:02.887+00	El Flaco del bar	\N
78	3	3	\N	finalizado	0	2026-04-01 22:32:03.365169+00	2026-04-01 22:41:28.24+00	Vero Mesa Villar 2	\N
88	13	3	\N	finalizado	200	2026-04-02 01:25:42.593995+00	2026-04-02 02:04:17.015+00	Chofere de Guagua de LA ruta	\N
90	4	3	\N	finalizado	200	2026-04-02 01:49:03.24838+00	2026-04-02 02:05:32.697+00	El de LA camisa Azul juego villar Mesa 2	\N
91	12	3	\N	finalizado	550	2026-04-02 01:50:06.125969+00	2026-04-02 02:32:41.128+00	El Moreno del bar	\N
80	4	3	\N	finalizado	400	2026-04-01 22:48:29.256294+00	2026-04-01 22:58:19.884+00	El gordita del bar del poloche verdes	\N
105	3	3	\N	finalizado	400	2026-04-03 01:37:52.217102+00	2026-04-03 02:20:35.762+00	Rodelin	\N
81	5	3	\N	finalizado	200	2026-04-01 22:54:47.832862+00	2026-04-01 23:02:26.402+00	El señor del poloche negro del bar	\N
79	3	3	\N	finalizado	600	2026-04-01 22:42:24.077251+00	2026-04-01 23:17:30.405+00	El señor del bar	\N
83	4	3	\N	finalizado	200	2026-04-02 00:19:58.501534+00	2026-04-02 01:02:21.246+00	El juego mesa de Villar 2	\N
85	4	3	\N	cancelado	0	2026-04-02 01:03:23.665271+00	2026-04-02 01:03:36.11+00	Chelo juego de villa mesa	\N
92	4	3	\N	finalizado	350	2026-04-02 03:09:53.448062+00	2026-04-02 03:10:35.932+00	Joel El esposo de titi	\N
82	3	3	\N	finalizado	3000	2026-04-01 23:50:40.595328+00	2026-04-02 03:48:28.921+00	El viejero mesa de Villar 1	\N
84	5	3	\N	finalizado	400	2026-04-02 00:40:48.721505+00	2026-04-02 03:54:53.666+00	Abelito	\N
101	12	3	\N	cancelado	0	2026-04-03 00:44:26.543503+00	2026-04-03 00:51:49.93+00	Abelito	\N
116	3	3	\N	finalizado	200	2026-04-04 22:32:31.186592+00	2026-04-04 22:43:17.965+00	Tiki semillero mesa de Villar 2	\N
98	4	3	\N	finalizado	200	2026-04-03 00:31:43.219576+00	2026-04-03 00:53:14.411+00	LA Joven de LA esquina	\N
93	3	3	\N	finalizado	600	2026-04-02 21:09:09.519876+00	2026-04-02 22:18:42.878+00	Wilto primo	\N
94	4	3	\N	finalizado	400	2026-04-02 22:14:24.828209+00	2026-04-02 22:48:20.151+00	El Tipo de LA franela Verdes juego villar Mesa 2	\N
99	5	3	\N	finalizado	300	2026-04-03 00:35:50.532874+00	2026-04-03 01:05:55.417+00	Wilto primo	\N
95	3	3	\N	finalizado	400	2026-04-02 23:06:16.921625+00	2026-04-02 23:07:31.438+00	El señor amigo morenito	\N
122	13	3	\N	finalizado	200	2026-04-05 00:06:49.421207+00	2026-04-05 00:25:10.14+00	Alcanfor	\N
97	3	3	\N	finalizado	400	2026-04-03 00:30:35.530367+00	2026-04-03 01:21:07.157+00	Osmali	\N
131	3	3	\N	finalizado	200	2026-04-05 03:42:36.069471+00	2026-04-05 03:59:02.481+00	Alcanfor	\N
102	1	3	\N	finalizado	600	2026-04-03 00:49:21.561477+00	2026-04-03 01:23:45.393+00	El Gordo bar de LA guagua	\N
104	3	3	\N	finalizado	200	2026-04-03 01:21:39.347209+00	2026-04-03 01:29:56.643+00	Rodelin	\N
107	3	3	\N	finalizado	600	2026-04-03 02:24:37.037211+00	2026-04-03 03:19:26.329+00	El viajero	\N
108	4	3	\N	finalizado	1050	2026-04-03 02:40:11.389509+00	2026-04-03 03:23:31.952+00	Abelito	\N
118	13	3	\N	finalizado	800	2026-04-04 22:45:48.560568+00	2026-04-04 23:15:20.264+00	El poloche rojo El prieto	\N
109	3	3	\N	finalizado	0	2026-04-04 19:29:58.098181+00	2026-04-04 19:35:01.616+00	Jose	\N
112	3	3	\N	finalizado	550	2026-04-04 21:08:47.055313+00	2026-04-04 22:20:50.778+00	Abelito	\N
110	3	3	\N	finalizado	0	2026-04-04 20:17:21.463315+00	2026-04-04 20:49:06.216+00	Mesa Villar 1 poloche	\N
113	4	3	\N	finalizado	200	2026-04-04 21:13:56.905465+00	2026-04-04 22:29:17.594+00	Juego mesa de Villar 2	\N
135	3	3	\N	finalizado	200	2026-04-05 04:36:14.016776+00	2026-04-05 04:48:07.923+00	El de LA does trenza	\N
115	3	3	\N	cancelado	200	2026-04-04 22:31:15.230862+00	2026-04-04 22:31:40.572+00	Tiki semillero	\N
120	13	3	\N	finalizado	400	2026-04-04 23:20:25.748411+00	2026-04-05 00:02:25.777+00	El juego mesa 2	\N
127	5	3	\N	finalizado	200	2026-04-05 02:24:51.92482+00	2026-04-05 02:47:32.716+00	Mesa de Villar 2	\N
111	1	3	\N	cancelado	400	2026-04-04 20:21:49.383704+00	2026-04-05 01:53:04.292+00	Mesa villar 1	\N
114	5	3	\N	finalizado	3700	2026-04-04 21:19:50.627596+00	2026-04-05 00:40:29.649+00	Ariel	\N
128	5	3	\N	finalizado	450	2026-04-05 02:48:19.134953+00	2026-04-05 03:39:28.961+00	Mesa Villar 2	\N
123	13	3	\N	finalizado	200	2026-04-05 00:32:41.684676+00	2026-04-05 00:46:52.838+00	El amigo del frente de LA arena	\N
121	12	3	\N	finalizado	400	2026-04-05 00:02:03.420496+00	2026-04-05 02:20:47.77+00	Los morenos del bar	\N
124	5	3	\N	finalizado	400	2026-04-05 00:48:07.335912+00	2026-04-05 02:23:41.655+00	El mecanico juego de Villar 2	\N
126	2	3	\N	finalizado	800	2026-04-05 01:16:38.50919+00	2026-04-05 05:11:26.182+00	Amigo de abelito	\N
117	3	3	\N	finalizado	2450	2026-04-04 22:44:23.462061+00	2026-04-05 03:25:11.163+00	LA beby	\N
129	12	3	\N	finalizado	600	2026-04-05 03:00:46.115924+00	2026-04-05 03:52:48.77+00	El Rubio del bar	\N
133	13	3	\N	finalizado	200	2026-04-05 04:01:32.739107+00	2026-04-05 04:31:35.11+00	El hijo de bilindi	\N
134	3	3	\N	finalizado	200	2026-04-05 04:13:50.368388+00	2026-04-05 04:35:32.347+00	Daniel	\N
132	3	3	\N	finalizado	200	2026-04-05 03:59:45.199637+00	2026-04-05 04:10:01.419+00	Alcanfor	\N
119	4	3	\N	finalizado	2000	2026-04-04 22:51:51.363445+00	2026-04-05 05:42:24.002+00	Abelito	\N
130	5	3	\N	finalizado	600	2026-04-05 03:41:34.95484+00	2026-04-05 04:39:40.211+00	Juego villar Mesa 2	\N
136	3	3	\N	finalizado	400	2026-04-05 04:59:31.752802+00	2026-04-05 05:43:50.227+00	Daniel	\N
137	3	3	\N	finalizado	1200	2026-04-05 23:35:34.8478+00	2026-04-05 23:45:16.088+00	Amigo	\N
152	4	3	\N	cancelado	425	2026-04-11 01:08:40.492383+00	2026-04-11 03:02:41.556+00	Las chica del bar	\N
154	3	3	\N	cancelado	600	2026-04-11 02:25:25.038124+00	2026-04-11 03:54:08.877+00	Mesa de Villar 1	\N
139	4	3	\N	finalizado	400	2026-04-06 01:41:19.097156+00	2026-04-06 01:59:04.706+00	Alcanfor mesa de Villar 2	\N
182	2	3	\N	cancelado	400	2026-04-13 00:39:15.903337+00	2026-04-13 02:36:39.744+00	Mela	\N
138	3	3	\N	finalizado	800	2026-04-06 00:30:28.913174+00	2026-04-06 02:43:53.222+00	Mesa de Villar 1	\N
180	12	3	\N	finalizado	700	2026-04-13 00:15:33.475629+00	2026-04-13 00:42:22.724+00	Fredy amigo	\N
164	3	3	\N	cancelado	200	2026-04-12 20:22:10.884642+00	2026-04-12 20:46:14.984+00	Mesa de Villar 2	\N
140	3	3	\N	finalizado	400	2026-04-06 23:30:21.554972+00	2026-04-07 03:08:17.63+00	Mesa de Villar 1	\N
141	4	3	\N	finalizado	200	2026-04-07 01:12:38.257302+00	2026-04-07 03:08:35.085+00	Mesa de Villar 2	\N
196	12	3	\N	finalizado	850	2026-04-15 01:37:01.811596+00	2026-04-15 03:38:28.32+00	Abelito	\N
167	3	3	\N	cancelado	200	2026-04-12 20:46:42.461174+00	2026-04-12 20:47:31.686+00	Mesa de Villar 1	\N
165	4	3	\N	cancelado	400	2026-04-12 20:32:11.057067+00	2026-04-12 20:47:35.706+00	Mesa de Villar 2	\N
143	4	3	\N	finalizado	400	2026-04-09 22:33:43.590002+00	2026-04-09 23:12:55.56+00	El señor del bar	\N
156	4	3	\N	finalizado	600	2026-04-11 20:38:51.320713+00	2026-04-11 21:58:55.102+00	Mesa Villar 2	\N
142	3	3	\N	cancelado	1000	2026-04-09 22:33:07.466661+00	2026-04-10 00:19:20.624+00	El amigo del bar	\N
155	3	3	\N	finalizado	200	2026-04-11 20:36:46.654595+00	2026-04-11 22:02:07.261+00	Juego de Villar 1	\N
144	4	3	\N	finalizado	200	2026-04-09 23:56:41.231913+00	2026-04-10 00:46:40.675+00	El de LA trenza	\N
176	4	3	\N	finalizado	1215	2026-04-12 22:25:31.218407+00	2026-04-12 22:57:50.642+00	El señor del bar	\N
170	13	3	\N	finalizado	400	2026-04-12 20:49:49.875192+00	2026-04-12 22:59:07.714+00	El viajero	\N
145	3	3	\N	finalizado	800	2026-04-10 00:19:45.344701+00	2026-04-10 01:25:55.202+00	Amigo bar	\N
146	4	3	\N	cancelado	400	2026-04-10 00:54:38.145895+00	2026-04-10 01:26:52.034+00	Mesa de Villar 1	\N
147	5	3	\N	finalizado	200	2026-04-10 00:57:07.859434+00	2026-04-10 01:29:10.76+00	Mesa de Villar 2	\N
148	3	3	\N	finalizado	200	2026-04-10 01:32:07.671014+00	2026-04-10 02:00:01.186+00	Amigo bar	\N
159	3	3	\N	finalizado	200	2026-04-11 22:44:43.258906+00	2026-04-11 23:00:24.618+00	Mesa de Villar 1	\N
149	3	3	\N	finalizado	200	2026-04-10 22:18:09.369916+00	2026-04-10 22:20:25.531+00	Mesa de Villar 1	\N
150	4	3	\N	finalizado	200	2026-04-10 22:18:34.09966+00	2026-04-10 22:47:49.142+00	Mesa de villar 2	\N
151	3	3	\N	finalizado	200	2026-04-11 00:56:27.425062+00	2026-04-11 01:32:10.885+00	Mesa de Villar 1	\N
160	13	3	\N	cancelado	200	2026-04-11 22:49:35.098705+00	2026-04-11 23:35:59.289+00	Karina	\N
153	3	3	\N	finalizado	200	2026-04-11 01:34:18.301435+00	2026-04-11 02:21:31.887+00	Mesa de Villar 1	\N
169	4	3	\N	finalizado	200	2026-04-12 20:48:23.777189+00	2026-04-12 20:57:39.386+00	Mesa de Villar 2	\N
161	3	3	\N	finalizado	400	2026-04-11 23:06:04.618315+00	2026-04-11 23:40:29.405+00	Mesa de Villar 1	\N
163	3	3	\N	finalizado	200	2026-04-11 23:41:15.127878+00	2026-04-11 23:42:10.888+00	El amigo banco	\N
168	3	3	\N	finalizado	600	2026-04-12 20:48:01.91981+00	2026-04-12 21:26:51.335+00	Mesa de Villar 1	\N
172	3	3	\N	cancelado	0	2026-04-12 21:28:55.348456+00	2026-04-12 21:28:55.503+00	El señor del bar	\N
158	4	3	\N	finalizado	400	2026-04-11 22:01:30.864872+00	2026-04-11 23:58:40.023+00	Jairo	\N
166	5	3	\N	finalizado	200	2026-04-12 20:33:50.822399+00	2026-04-12 21:29:31.813+00	Mujer	\N
171	4	3	\N	finalizado	200	2026-04-12 21:10:10.292402+00	2026-04-12 21:38:54.978+00	Mesa 2	\N
162	13	3	\N	finalizado	600	2026-04-11 23:36:44.058021+00	2026-04-12 00:13:08.953+00	El señor de barv	\N
157	5	3	\N	finalizado	1900	2026-04-11 21:52:32.416672+00	2026-04-12 00:43:08.547+00	Abelito	\N
190	3	3	\N	finalizado	400	2026-04-13 21:17:42.085125+00	2026-04-13 22:35:13.913+00	Mesa de Villar 1	\N
178	5	3	\N	cancelado	200	2026-04-12 23:40:53.417573+00	2026-04-13 02:37:09.228+00	El amigo	\N
179	13	3	\N	finalizado	1200	2026-04-12 23:44:26.688169+00	2026-04-13 01:57:00.49+00	El Joven del poloche de ralla del bar	\N
173	3	3	\N	finalizado	200	2026-04-12 21:47:22.013611+00	2026-04-12 22:08:30.304+00	Mesa de Villar 2	\N
177	4	3	\N	finalizado	1200	2026-04-12 23:36:39.292171+00	2026-04-13 01:58:00.028+00	Abisail	\N
174	3	3	\N	finalizado	200	2026-04-12 22:15:18.86771+00	2026-04-12 22:20:30.574+00	Mesa Villar 2	\N
175	3	3	\N	cancelado	200	2026-04-12 22:23:08.97085+00	2026-04-13 00:44:41.536+00	Carolyn	\N
181	1	3	\N	finalizado	0	2026-04-13 00:34:15.960567+00	2026-04-13 00:47:41.893+00	Mesa de Villar 2	\N
187	4	3	\N	finalizado	400	2026-04-13 02:05:57.050158+00	2026-04-13 02:21:16.038+00	Rodelin	\N
189	5	3	\N	finalizado	200	2026-04-13 02:55:55.967201+00	2026-04-13 02:56:49.872+00	Luis amigo de cristofer	\N
191	3	3	\N	finalizado	200	2026-04-13 23:24:38.748037+00	2026-04-14 00:15:51.509+00	Mesa de Villar 1	\N
186	12	3	\N	finalizado	400	2026-04-13 01:32:57.207129+00	2026-04-13 03:11:16.913+00	Daniel	\N
184	12	3	\N	finalizado	200	2026-04-13 00:44:08.52832+00	2026-04-13 00:58:08.194+00	Fredy amigo	\N
188	4	3	\N	finalizado	400	2026-04-13 02:22:37.539184+00	2026-04-13 03:20:57.912+00	Critofe	\N
185	3	3	\N	finalizado	600	2026-04-13 00:52:05.38459+00	2026-04-13 03:29:19.688+00	Mesa de Villar 2	\N
197	3	3	\N	finalizado	200	2026-04-15 03:03:13.888894+00	2026-04-15 03:40:57.334+00	Amigo del poloche blanco	\N
183	6	3	\N	finalizado	500	2026-04-13 00:40:20.156724+00	2026-04-13 03:33:43.978+00	Abelito	\N
194	5	3	\N	finalizado	400	2026-04-15 01:35:04.276617+00	2026-04-15 03:11:52.296+00	El viajero	\N
193	4	3	\N	finalizado	1200	2026-04-15 01:34:09.706099+00	2026-04-15 03:40:40.885+00	El señor de poloche blanco	\N
192	3	3	\N	finalizado	200	2026-04-15 01:33:50.757365+00	2026-04-15 01:42:56.079+00	Rodelin	\N
195	13	3	\N	finalizado	1100	2026-04-15 01:36:13.880002+00	2026-04-15 03:37:50.815+00	El señor de franela Azul de sofa	\N
198	13	3	\N	finalizado	200	2026-04-15 21:01:55.025313+00	2026-04-15 22:37:56.053+00	Juan	\N
199	12	3	\N	finalizado	800	2026-04-16 01:14:04.677965+00	2026-04-16 03:21:47.195+00	Jose	\N
201	3	3	\N	cancelado	0	2026-04-16 02:32:45.531897+00	2026-04-16 02:36:25.474+00	\N	\N
200	6	3	\N	finalizado	600	2026-04-16 02:29:20.983966+00	2026-04-16 03:16:21.605+00	Juan	\N
202	3	3	\N	cancelado	0	2026-04-16 20:13:59.865509+00	2026-04-16 21:04:06.336+00	\N	\N
203	4	3	\N	finalizado	850	2026-04-16 22:17:58.790048+00	2026-04-16 23:36:41.436+00	Juana	\N
204	12	3	\N	finalizado	200	2026-04-16 22:30:20.868185+00	2026-04-16 22:32:45.405+00	Juan	\N
205	13	3	\N	cancelado	200	2026-04-16 22:52:24.835884+00	2026-04-16 22:55:21.46+00	Jose	\N
206	13	3	\N	finalizado	600	2026-04-17 00:10:34.767908+00	2026-04-17 01:41:33.981+00	Jose	\N
207	13	3	\N	cancelado	0	2026-04-17 02:01:24.928756+00	2026-04-17 02:02:48.429+00	Mesa Villar 1 poloche	\N
208	9	3	\N	cancelado	0	2026-04-17 22:02:35.879197+00	2026-04-17 22:02:28.322+00	\N	\N
226	12	3	\N	finalizado	200	2026-04-19 02:22:33.601657+00	2026-04-19 02:41:38.21+00	Mesa de Villar 1	\N
209	11	3	\N	finalizado	400	2026-04-17 22:03:04.497509+00	2026-04-17 22:37:47.694+00	Jose	\N
211	12	3	\N	cancelado	200	2026-04-17 22:36:49.528348+00	2026-04-17 22:38:37.907+00	Ballar 1	\N
227	12	3	\N	finalizado	200	2026-04-19 02:44:41.055617+00	2026-04-19 03:30:12.057+00	Mesa de Villar 1	\N
210	1	3	\N	cancelado	200	2026-04-17 22:11:40.45167+00	2026-04-17 22:40:05.447+00	Luis	\N
213	12	3	\N	finalizado	200	2026-04-17 22:41:14.188003+00	2026-04-17 23:03:49.043+00	Billar 1	\N
247	6	3	\N	cancelado	0	2026-04-23 01:36:50.389124+00	2026-04-23 01:36:38.793+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
261	4	3	\N	finalizado	600	2026-04-25 03:17:15.666036+00	2026-04-25 03:17:21.79+00	Jose	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
214	12	3	\N	finalizado	200	2026-04-17 23:08:51.716718+00	2026-04-17 23:20:19.985+00	Mesa de Villar 1	\N
228	13	3	\N	finalizado	400	2026-04-19 20:17:58.100211+00	2026-04-19 21:17:33.271+00	Mesa Villar 2	\N
215	1	3	\N	finalizado	600	2026-04-17 23:17:18.452804+00	2026-04-18 00:11:29.662+00	Jose	\N
212	13	3	\N	finalizado	400	2026-04-17 22:39:28.235768+00	2026-04-18 00:26:59.442+00	Ballar 2	\N
229	3	3	\N	finalizado	200	2026-04-19 22:51:26.650985+00	2026-04-19 23:28:51.38+00	Jose	\N
246	3	3	\N	cancelado	15	2026-04-22 21:47:08.216263+00	2026-04-23 12:36:34.651+00	Mesa 1	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
216	13	3	\N	finalizado	800	2026-04-18 00:43:43.672955+00	2026-04-18 03:38:37.254+00	Jose	\N
217	3	3	\N	finalizado	0	2026-04-18 20:57:02.800451+00	2026-04-18 21:02:22.247+00	Mesa Villar 1 poloche	\N
248	4	2	\N	cancelado	175	2026-04-23 12:35:59.061941+00	2026-04-23 12:36:43.969+00	2	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
218	3	3	\N	cancelado	200	2026-04-18 21:13:16.491178+00	2026-04-18 21:19:26.281+00	Mesa Villar 1 poloche	\N
219	3	3	\N	cancelado	0	2026-04-18 21:20:06.793734+00	2026-04-18 21:20:48.717+00	Mesa Villar 1 poloche	\N
249	13	3	\N	cancelado	0	2026-04-23 19:28:57.439451+00	2026-04-23 19:28:47.392+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
221	13	3	\N	finalizado	200	2026-04-18 22:12:22.795727+00	2026-04-18 22:28:45.667+00	Mesa de Villar 2	\N
230	2	3	\N	finalizado	650	2026-04-20 00:00:22.451004+00	2026-04-20 02:12:01.26+00	Jose	\N
220	12	3	\N	finalizado	800	2026-04-18 22:11:41.885326+00	2026-04-18 23:20:15.638+00	Mesa de Villar 1	\N
250	5	3	\N	finalizado	0	2026-04-23 19:29:43.924599+00	2026-04-23 19:29:44.936+00	Barra	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
222	12	3	\N	cancelado	600	2026-04-19 00:48:20.220447+00	2026-04-19 01:33:04.53+00	Mesa de Villar 1	\N
231	13	3	\N	cancelado	400	2026-04-20 23:02:07.277226+00	2026-04-20 23:25:26.443+00	Mesa de Villar 2	\N
223	12	3	\N	finalizado	0	2026-04-19 01:33:31.402745+00	2026-04-19 01:33:34.071+00	Mesa de Villar 1	\N
232	13	3	\N	finalizado	0	2026-04-20 23:26:09.057919+00	2026-04-20 23:26:12.557+00	Mesa de Villar 2	\N
225	11	3	\N	finalizado	200	2026-04-19 01:43:15.643774+00	2026-04-19 02:03:18.118+00	Jose	\N
224	12	3	\N	finalizado	600	2026-04-19 01:34:11.654457+00	2026-04-19 02:19:05.138+00	Mesa de Villar 1	\N
233	13	3	\N	finalizado	200	2026-04-20 23:27:14.321883+00	2026-04-20 23:36:25.579+00	Mesa de Villar 2	\N
251	13	3	\N	finalizado	200	2026-04-23 22:39:14.732556+00	2026-04-23 22:55:32.51+00	Mesa de Villar 2	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
234	13	3	\N	finalizado	300	2026-04-20 23:39:08.927469+00	2026-04-20 23:57:30.13+00	Mesa de Villar 2	\N
235	12	3	\N	cancelado	0	2026-04-21 23:05:15.866997+00	2026-04-21 23:05:11.055+00	Casa	\N
236	3	3	\N	finalizado	150	2026-04-21 23:05:46.191754+00	2026-04-22 00:34:19.432+00	Casa	\N
242	3	2	\N	cancelado	0	2026-04-22 20:58:51.899655+00	2026-04-22 20:59:08.246+00	Elier	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
243	3	2	\N	cancelado	0	2026-04-22 20:59:21.702152+00	2026-04-22 20:59:50.996+00	Juan	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
244	3	2	\N	cancelado	0	2026-04-22 21:02:17.873106+00	2026-04-22 21:02:26.645+00	1	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
245	12	3	\N	cancelado	0	2026-04-22 21:08:59.982973+00	2026-04-22 21:19:21.716+00	Mesa de Villar 1	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
252	12	3	\N	finalizado	200	2026-04-23 23:15:46.051498+00	2026-04-24 00:26:37.506+00	Billar 1	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
256	12	3	\N	cancelado	200	2026-04-25 01:11:35.452963+00	2026-04-25 01:16:06.634+00	Mesa de Villar 1	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
253	4	3	\N	cancelado	200	2026-04-24 20:28:25.565287+00	2026-04-24 20:37:49.011+00	Mesa de Villar 2	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
254	5	3	\N	cancelado	200	2026-04-24 20:36:34.43187+00	2026-04-24 20:39:24.851+00	Jose	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
257	13	3	\N	cancelado	2450	2026-04-25 01:12:04.035437+00	2026-04-25 02:40:42.478+00	Mesa de Villar 2	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
255	5	3	\N	finalizado	0	2026-04-24 20:39:59.701484+00	2026-04-24 20:45:34.114+00	Jose	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
260	13	3	\N	finalizado	0	2026-04-25 02:41:11.88643+00	2026-04-25 02:41:26.772+00	Mesa de Villar 2	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
266	4	3	\N	finalizado	1215	2026-04-25 22:26:34.394672+00	2026-04-25 23:30:03.904+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
270	4	3	\N	finalizado	575	2026-04-26 02:59:57.016831+00	2026-04-26 03:35:27.209+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
262	4	3	\N	cancelado	0	2026-04-25 03:21:31.028038+00	2026-04-25 03:24:27.574+00	Jose	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
264	4	3	\N	finalizado	200	2026-04-25 21:03:41.818807+00	2026-04-25 21:06:19.59+00	Barra	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
259	4	3	\N	cancelado	800	2026-04-25 02:22:34.233524+00	2026-04-25 03:16:46.097+00	Barra	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
263	13	3	\N	finalizado	400	2026-04-25 20:42:34.003218+00	2026-04-25 21:34:12.297+00	Mesa de Villar 2	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
258	12	3	\N	finalizado	3200	2026-04-25 01:16:42.335225+00	2026-04-25 04:26:48.61+00	Mesa de Villar 1	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
269	2	3	\N	finalizado	1625	2026-04-26 02:36:47.426977+00	2026-04-26 02:42:09.308+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
267	13	3	\N	finalizado	2100	2026-04-25 23:07:30.009449+00	2026-04-26 02:00:12.87+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
268	13	3	\N	finalizado	600	2026-04-26 02:15:25.805876+00	2026-04-26 03:32:21.156+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
271	13	3	\N	finalizado	900	2026-04-26 21:40:12.521032+00	2026-04-26 22:52:41.582+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
265	3	3	\N	finalizado	300	2026-04-25 22:09:57.328865+00	2026-04-26 03:33:07.071+00	Abel	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
272	13	3	\N	finalizado	200	2026-04-27 22:58:22.271968+00	2026-04-27 23:19:49.707+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
274	13	3	\N	finalizado	750	2026-04-28 23:50:29.511499+00	2026-04-29 03:09:27.212+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
273	4	3	\N	finalizado	1000	2026-04-28 23:49:57.624834+00	2026-04-29 00:07:54.949+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
275	5	3	\N	finalizado	800	2026-04-29 21:38:12.322928+00	2026-05-01 00:22:04.928+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
277	12	3	\N	finalizado	800	2026-04-30 23:33:42.37199+00	2026-05-01 00:42:00.534+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
276	13	3	\N	finalizado	800	2026-04-30 23:33:30.554656+00	2026-05-01 01:46:47+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
278	13	3	\N	finalizado	200	2026-05-01 23:17:57.577628+00	2026-05-02 00:50:40.401+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
298	3	3	\N	finalizado	800	2026-05-06 23:17:54.065576+00	2026-05-07 02:36:33.959+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
281	11	3	\N	finalizado	0	2026-05-02 02:46:43.706645+00	2026-05-02 02:46:41.194+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
299	13	3	\N	finalizado	200	2026-05-07 02:35:36.740801+00	2026-05-07 03:41:22.701+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
279	13	3	\N	finalizado	600	2026-05-02 00:53:00.062291+00	2026-05-02 02:56:31.533+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
282	4	3	\N	finalizado	0	2026-05-02 02:57:30.432619+00	2026-05-02 02:57:26.432+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
280	2	3	\N	finalizado	400	2026-05-02 02:32:19.612023+00	2026-05-02 04:19:57.076+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
300	12	3	\N	cancelado	600	2026-05-07 02:36:00.228848+00	2026-05-07 20:07:39.016+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
283	13	3	\N	finalizado	800	2026-05-02 23:34:45.063571+00	2026-05-03 01:25:01.518+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
304	1	3	\N	finalizado	1800	2026-05-12 23:58:32.623534+00	2026-05-13 01:05:23.003+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
303	2	3	\N	finalizado	900	2026-05-12 23:57:43.591706+00	2026-05-13 01:08:08.602+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
288	2	3	\N	finalizado	200	2026-05-03 02:10:42.86774+00	2026-05-03 02:26:27.002+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
305	3	2	\N	cancelado	0	2026-05-13 13:30:26.634796+00	2026-05-13 13:50:02.698+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
286	4	3	\N	finalizado	1250	2026-05-03 01:27:18.788941+00	2026-05-03 02:36:50.971+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
301	12	3	\N	cancelado	600	2026-05-12 23:56:44.62717+00	2026-05-13 20:03:59.468+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
302	13	3	\N	cancelado	600	2026-05-12 23:57:06.65907+00	2026-05-13 20:04:17.567+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
284	13	3	\N	finalizado	600	2026-05-03 01:26:22.23563+00	2026-05-03 03:26:53.232+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
287	1	3	\N	finalizado	1000	2026-05-03 01:51:57.005254+00	2026-05-03 03:45:12.284+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
289	2	3	\N	finalizado	475	2026-05-03 02:30:23.764913+00	2026-05-03 03:49:36.872+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
285	12	3	\N	finalizado	600	2026-05-03 01:26:51.784803+00	2026-05-03 03:53:44.867+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
290	4	3	\N	finalizado	200	2026-05-03 03:28:36.52996+00	2026-05-03 03:56:54.377+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
306	4	3	\N	cancelado	0	2026-05-13 20:34:54.508265+00	2026-05-14 01:45:30.875+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
291	3	3	\N	finalizado	0	2026-05-03 21:56:35.556896+00	2026-05-03 21:57:47.675+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
292	13	3	\N	finalizado	0	2026-05-03 21:58:58.840152+00	2026-05-03 21:58:56.732+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
293	3	3	\N	finalizado	0	2026-05-05 23:23:53.309875+00	2026-05-05 23:28:17.108+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
294	3	3	\N	finalizado	0	2026-05-05 23:44:18.711555+00	2026-05-05 23:45:06.904+00	Mesa de Villar 1	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
295	13	3	\N	cancelado	200	2026-05-06 00:37:10.603+00	2026-05-06 20:18:30.589+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
296	13	3	\N	finalizado	0	2026-05-06 23:16:34.955245+00	2026-05-06 23:16:52.598+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
297	13	3	\N	finalizado	0	2026-05-06 23:17:10.034936+00	2026-05-06 23:17:39.106+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
307	13	3	\N	finalizado	400	2026-05-14 01:48:03.195287+00	2026-05-14 01:49:26.935+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
\.


--
-- Data for Name: pedidos_mesa_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos_mesa_detalle (id, pedido_id, producto_id, producto_nombre, cantidad, precio_unitario, subtotal, estado_pago, created_at, notas, estado_preparacion, negocio_id) FROM stdin;
1	1	1	Cerveza Presidente	2	200	400	pendiente	2026-02-24 18:47:48.972765+00	\N	solicitado	\N
2	2	1	Cerveza Presidente	2	200	400	pendiente	2026-02-24 20:58:49.474732+00	\N	solicitado	\N
3	6	2	presi normal gr	2	200	400	pendiente	2026-03-26 21:35:24.799543+00	\N	solicitado	\N
4	6	49	Barcelo gran anejo pq	1	600	600	pendiente	2026-03-26 21:36:31.353741+00	\N	solicitado	\N
5	7	47	Doble reserva pq	1	750	750	pendiente	2026-03-26 21:37:53.772173+00	\N	solicitado	\N
6	8	49	Barcelo gran anejo pq	1	600	600	pendiente	2026-03-26 21:45:03.065006+00	\N	solicitado	\N
7	9	47	Doble reserva pq	1	750	750	pendiente	2026-03-27 14:15:49.077624+00	\N	solicitado	\N
8	10	46	Brugal XV pq	2	650	1300	pendiente	2026-03-27 14:16:15.84407+00	\N	solicitado	\N
9	9	49	Barcelo gran anejo pq	1	600	600	pendiente	2026-03-27 14:23:23.560396+00	\N	solicitado	\N
10	11	46	Brugal XV pq	1	650	650	pendiente	2026-03-27 17:20:04.660246+00	\N	solicitado	\N
12	13	48	Barcelo gran anejo	1	1000	1000	pendiente	2026-03-28 20:22:57.40311+00	\N	solicitado	\N
13	14	2	presi normal gr	2	200	400	pendiente	2026-03-28 21:09:11.894245+00	\N	solicitado	\N
11	12	2	presi normal gr	3	200	600	pendiente	2026-03-28 20:21:03.808704+00	\N	solicitado	\N
14	15	2	presi normal gr	1	200	200	pendiente	2026-03-29 00:00:55.962858+00	\N	solicitado	\N
15	16	2	presi normal gr	1	200	200	pendiente	2026-03-29 00:16:09.213986+00	\N	solicitado	\N
16	17	2	presi normal gr	1	200	200	pendiente	2026-03-29 00:27:07.935223+00	\N	solicitado	\N
17	18	2	presi normal gr	1	200	200	pendiente	2026-03-29 00:38:13.502151+00	\N	solicitado	\N
18	19	2	presi normal gr	2	200	400	pendiente	2026-03-29 00:43:31.602338+00	\N	solicitado	\N
19	20	2	presi normal gr	1	200	200	pendiente	2026-03-29 00:44:54.651409+00	\N	solicitado	\N
20	21	2	presi normal gr	2	200	400	pendiente	2026-03-29 00:53:08.754181+00	\N	solicitado	\N
22	23	1	presi light gr 	1	200	200	pendiente	2026-03-29 01:35:21.42129+00	\N	solicitado	\N
23	24	1	presi light gr 	1	200	200	pendiente	2026-03-29 01:54:34.034169+00	\N	solicitado	\N
21	22	2	presi normal gr	2	200	400	pendiente	2026-03-29 01:06:27.304944+00	\N	solicitado	\N
26	26	2	presi normal gr	1	200	200	pendiente	2026-03-29 02:17:11.779816+00	\N	solicitado	\N
27	26	1	presi light gr 	1	200	200	pendiente	2026-03-29 02:17:12.433636+00	\N	solicitado	\N
28	27	2	presi normal gr	1	200	200	pendiente	2026-03-29 02:50:06.136851+00	\N	solicitado	\N
29	28	2	presi normal gr	1	200	200	pendiente	2026-03-29 03:02:01.007403+00	\N	solicitado	\N
30	28	34	añejo peq	1	600	600	pendiente	2026-03-29 03:02:01.778964+00	\N	solicitado	\N
32	29	1	presi light gr 	1	200	200	pendiente	2026-03-29 03:05:15.696567+00	\N	solicitado	\N
33	29	2	presi normal gr	1	200	200	pendiente	2026-03-29 03:09:23.512304+00	\N	solicitado	\N
34	27	1	presi light gr 	1	200	200	pendiente	2026-03-29 03:24:24.33126+00	\N	solicitado	\N
41	36	2	presi normal gr	3	200	600	pendiente	2026-03-29 21:52:33.803745+00	\N	solicitado	\N
24	25	9	one gra	4	175	700	pendiente	2026-03-29 02:13:58.926239+00	\N	solicitado	\N
43	38	1	presi light gr 	1	200	200	pendiente	2026-03-29 22:17:54.952988+00	\N	solicitado	\N
35	30	1	presi light gr 	3	200	600	pendiente	2026-03-29 03:28:26.440937+00	\N	solicitado	\N
36	31	8	modelo peq	1	200	200	pendiente	2026-03-29 04:22:20.10176+00	\N	solicitado	\N
56	49	3	presi normal peq	2	150	300	pendiente	2026-03-30 03:19:46.14988+00	\N	solicitado	\N
37	32	1	presi light gr 	5	200	1000	pendiente	2026-03-29 20:07:50.138597+00	\N	solicitado	\N
48	43	1	presi light gr 	3	200	600	pendiente	2026-03-30 00:34:44.341217+00	\N	solicitado	\N
40	35	2	presi normal gr	1	200	200	pendiente	2026-03-29 21:12:41.353181+00	\N	solicitado	\N
49	44	3	presi normal peq	7	150	1050	pendiente	2026-03-30 00:42:14.460484+00	\N	solicitado	\N
42	37	1	presi light gr 	5	200	1000	pendiente	2026-03-29 22:06:07.170314+00	\N	solicitado	\N
39	34	1	presi light gr 	3	200	600	pendiente	2026-03-29 20:58:29.836855+00	\N	solicitado	\N
38	33	1	presi light gr 	7	200	1400	pendiente	2026-03-29 20:31:08.461086+00	\N	solicitado	\N
45	40	1	presi light gr 	2	200	400	pendiente	2026-03-29 23:39:54.82828+00	\N	solicitado	\N
57	51	1	presi light gr 	2	200	400	pendiente	2026-03-30 03:53:21.65828+00	\N	solicitado	\N
46	41	1	presi light gr 	8	200	1600	pendiente	2026-03-30 00:15:51.105004+00	\N	solicitado	\N
58	52	3	presi normal peq	1	150	150	pendiente	2026-03-30 03:54:56.743542+00	\N	solicitado	\N
44	39	1	presi light gr 	3	200	600	pendiente	2026-03-29 23:32:08.770159+00	\N	solicitado	\N
59	53	47	Doble reserva pq	1	750	750	pendiente	2026-03-30 04:27:40.700374+00	\N	solicitado	\N
47	42	1	presi light gr 	2	200	400	pendiente	2026-03-30 00:32:37.337637+00	\N	solicitado	\N
50	45	1	presi light gr 	1	200	200	pendiente	2026-03-30 01:48:40.108251+00	\N	solicitado	\N
51	46	1	presi light gr 	1	200	200	pendiente	2026-03-30 01:50:15.834498+00	\N	solicitado	\N
52	47	3	presi normal peq	3	150	450	pendiente	2026-03-30 01:59:35.552943+00	\N	solicitado	\N
53	48	47	Doble reserva pq	1	750	750	pendiente	2026-03-30 02:52:47.12356+00	\N	solicitado	\N
54	49	4	presi light peq	2	150	300	pendiente	2026-03-30 02:56:30.42737+00	\N	solicitado	\N
55	50	1	presi light gr 	1	200	200	pendiente	2026-03-30 03:17:05.150956+00	\N	solicitado	\N
60	54	1	presi light gr 	2	200	400	pendiente	2026-03-30 20:55:42.268722+00	\N	solicitado	\N
61	54	4	presi light peq	1	150	150	pendiente	2026-03-30 22:13:55.979981+00	\N	solicitado	\N
63	56	1	presi light gr 	2	200	400	pendiente	2026-03-30 23:52:10.248382+00	\N	solicitado	\N
65	58	2	presi normal gr	2	200	400	pendiente	2026-03-31 00:04:31.549404+00	\N	solicitado	\N
66	58	1	presi light gr 	1	200	200	pendiente	2026-03-31 00:22:06.794397+00	\N	solicitado	\N
62	55	1	presi light gr 	3	200	600	pendiente	2026-03-30 23:41:34.53851+00	\N	solicitado	\N
103	90	2	presi normal gr	1	200	200	pendiente	2026-04-02 01:49:12.085585+00	\N	solicitado	\N
67	55	2	presi normal gr	1	200	200	pendiente	2026-03-31 01:04:30.802914+00	\N	solicitado	\N
104	91	2	presi normal gr	2	200	400	pendiente	2026-04-02 01:50:23.983789+00	\N	solicitado	\N
68	59	1	presi light gr 	1	200	200	pendiente	2026-03-31 01:42:06.746305+00	\N	solicitado	\N
64	57	2	presi normal gr	6	200	1200	pendiente	2026-03-31 00:02:13.671491+00	\N	solicitado	\N
69	60	2	presi normal gr	1	200	200	pendiente	2026-03-31 21:37:15.564873+00	\N	solicitado	\N
70	61	4	presi light peq	2	150	300	pendiente	2026-03-31 21:43:07.747911+00	\N	solicitado	\N
105	91	4	presi light peq	1	150	150	pendiente	2026-04-02 01:50:24.845484+00	\N	solicitado	\N
72	62	13	911	1	100	100	pendiente	2026-03-31 22:08:02.269958+00	\N	solicitado	\N
71	61	3	presi normal peq	3	150	450	pendiente	2026-03-31 21:43:08.45401+00	\N	solicitado	\N
73	63	1	presi light gr 	2	200	400	pendiente	2026-03-31 22:19:35.064301+00	\N	solicitado	\N
74	64	2	presi normal gr	1	200	200	pendiente	2026-03-31 22:40:24.666054+00	\N	solicitado	\N
75	63	2	presi normal gr	1	200	200	pendiente	2026-03-31 22:42:21.635769+00	\N	solicitado	\N
76	65	1	presi light gr 	2	200	400	pendiente	2026-03-31 23:50:21.751234+00	\N	solicitado	\N
97	84	2	presi normal gr	2	200	400	pendiente	2026-04-02 00:40:55.84535+00	\N	solicitado	\N
78	67	1	presi light gr 	1	200	200	pendiente	2026-04-01 01:38:54.892158+00	\N	solicitado	\N
79	68	13	911	1	100	100	pendiente	2026-04-01 01:40:58.087796+00	\N	solicitado	\N
81	70	2	presi normal gr	2	200	400	pendiente	2026-04-01 01:46:54.134093+00	\N	solicitado	\N
117	102	1	presi light gr 	2	200	400	pendiente	2026-04-03 00:51:01.192612+00	\N	solicitado	\N
80	69	1	presi light gr 	2	200	400	pendiente	2026-04-01 01:44:04.909318+00	\N	solicitado	\N
83	72	1	presi light gr 	1	200	200	pendiente	2026-04-01 02:06:35.715481+00	\N	solicitado	\N
84	72	2	presi normal gr	1	200	200	pendiente	2026-04-01 02:27:16.100401+00	\N	solicitado	\N
106	92	3	presi normal peq	1	150	150	pendiente	2026-04-02 03:10:04.880883+00	\N	solicitado	\N
85	71	1	presi light gr 	1	200	200	pendiente	2026-04-01 02:34:30.214884+00	\N	solicitado	\N
107	92	1	presi light gr 	1	200	200	pendiente	2026-04-02 03:10:05.808666+00	\N	solicitado	\N
87	74	1	presi light gr 	1	200	200	pendiente	2026-04-01 03:06:14.525102+00	\N	solicitado	\N
86	73	2	presi normal gr	2	200	400	pendiente	2026-04-01 02:52:16.800848+00	\N	solicitado	\N
77	66	4	presi light peq	5	150	750	pendiente	2026-04-01 01:06:47.025719+00	\N	solicitado	\N
98	82	2	presi normal gr	6	200	1200	pendiente	2026-04-02 00:42:39.612909+00	\N	solicitado	\N
88	75	1	presi light gr 	1	200	200	pendiente	2026-04-01 03:37:22.787287+00	\N	solicitado	\N
82	71	2	presi normal gr	5	200	1000	pendiente	2026-04-01 02:00:00.485496+00	\N	solicitado	\N
89	76	2	presi normal gr	3	200	600	pendiente	2026-04-01 03:47:43.535915+00	\N	solicitado	\N
90	77	1	presi light gr 	1	200	200	pendiente	2026-04-01 22:26:10.211159+00	\N	solicitado	\N
93	81	1	presi light gr 	1	200	200	pendiente	2026-04-01 22:55:02.309984+00	\N	solicitado	\N
92	80	1	presi light gr 	2	200	400	pendiente	2026-04-01 22:48:35.976974+00	\N	solicitado	\N
91	79	1	presi light gr 	3	200	600	pendiente	2026-04-01 22:43:14.015895+00	\N	solicitado	\N
94	82	35	Doble reserva	1	1500	1500	pendiente	2026-04-01 23:51:01.843476+00	\N	solicitado	\N
95	82	14	jugo motts	1	300	300	pendiente	2026-04-01 23:51:02.735087+00	\N	solicitado	\N
96	83	2	presi normal gr	1	200	200	pendiente	2026-04-02 00:20:09.424517+00	\N	solicitado	\N
99	86	2	presi normal gr	1	200	200	pendiente	2026-04-02 01:04:24.631012+00	\N	solicitado	\N
100	87	1	presi light gr 	1	200	200	pendiente	2026-04-02 01:19:15.223533+00	\N	solicitado	\N
119	102	2	presi normal gr	1	200	200	pendiente	2026-04-03 00:52:49.976742+00	\N	solicitado	\N
101	88	2	presi normal gr	1	200	200	pendiente	2026-04-02 01:25:57.844573+00	\N	solicitado	\N
102	89	2	presi normal gr	1	200	200	pendiente	2026-04-02 01:37:42.013444+00	\N	solicitado	\N
118	103	2	presi normal gr	5	200	1000	pendiente	2026-04-03 00:51:25.04924+00	\N	solicitado	\N
108	93	1	presi light gr 	3	200	600	pendiente	2026-04-02 21:09:17.218719+00	\N	solicitado	\N
109	94	1	presi light gr 	2	200	400	pendiente	2026-04-02 22:14:31.442013+00	\N	solicitado	\N
110	95	1	presi light gr 	2	200	400	pendiente	2026-04-02 23:06:26.538574+00	\N	solicitado	\N
111	96	2	presi normal gr	1	200	200	pendiente	2026-04-03 00:18:56.178739+00	\N	solicitado	\N
113	98	1	presi light gr 	1	200	200	pendiente	2026-04-03 00:31:49.588834+00	\N	solicitado	\N
114	99	6	one peq	1	150	150	pendiente	2026-04-03 00:36:04.739981+00	\N	solicitado	\N
115	99	4	presi light peq	1	150	150	pendiente	2026-04-03 00:36:05.441952+00	\N	solicitado	\N
112	97	2	presi normal gr	2	200	400	pendiente	2026-04-03 00:30:48.592505+00	\N	solicitado	\N
120	103	55	Trident 	1	50	50	pendiente	2026-04-03 01:08:25.957103+00	\N	solicitado	\N
123	106	2	presi normal gr	1	200	200	pendiente	2026-04-03 01:53:40.58025+00	\N	solicitado	\N
122	105	2	presi normal gr	2	200	400	pendiente	2026-04-03 01:37:58.092375+00	\N	solicitado	\N
121	104	2	presi normal gr	1	200	200	pendiente	2026-04-03 01:21:46.004345+00	\N	solicitado	\N
116	100	2	presi normal gr	3	200	600	pendiente	2026-04-03 00:43:07.883458+00	\N	solicitado	\N
125	108	53	Smirnoff	2	225	450	pendiente	2026-04-03 02:40:24.888465+00	\N	solicitado	\N
126	108	2	presi normal gr	2	200	400	pendiente	2026-04-03 02:46:26.612009+00	\N	solicitado	\N
127	108	30	kings pride	1	200	200	pendiente	2026-04-03 03:07:23.747856+00	\N	solicitado	\N
124	107	2	presi normal gr	3	200	600	pendiente	2026-04-03 02:24:58.159154+00	\N	solicitado	\N
128	112	4	presi light peq	1	150	150	pendiente	2026-04-04 21:09:08.369184+00	\N	solicitado	\N
129	112	1	presi light gr 	1	200	200	pendiente	2026-04-04 21:09:09.156264+00	\N	solicitado	\N
130	113	1	presi light gr 	1	200	200	pendiente	2026-04-04 21:14:08.14736+00	\N	solicitado	\N
134	112	30	kings pride	1	200	200	pendiente	2026-04-04 21:29:13.04916+00	\N	solicitado	\N
174	141	1	presi light gr 	1	200	200	pendiente	2026-04-07 01:12:45.043881+00	\N	solicitado	\N
158	117	30	kings pride	1	200	200	pendiente	2026-04-05 02:48:44.901549+00	\N	solicitado	\N
136	115	1	presi light gr 	1	200	200	pendiente	2026-04-04 22:31:25.326431+00	\N	solicitado	\N
137	116	1	presi light gr 	1	200	200	pendiente	2026-04-04 22:32:37.844106+00	\N	solicitado	\N
175	140	2	presi normal gr	1	200	200	pendiente	2026-04-07 01:37:37.523097+00	\N	solicitado	\N
139	117	55	Trident 	1	50	50	pendiente	2026-04-04 22:44:38.188416+00	\N	solicitado	\N
157	128	1	presi light gr 	2	200	400	pendiente	2026-04-05 02:48:28.607217+00	\N	solicitado	\N
138	117	1	presi light gr 	11	200	2200	pendiente	2026-04-04 22:44:37.482984+00	\N	solicitado	\N
149	125	1	presi light gr 	6	200	1200	pendiente	2026-04-05 01:05:43.326286+00	\N	solicitado	\N
140	118	1	presi light gr 	4	200	800	pendiente	2026-04-04 22:45:58.678091+00	\N	solicitado	\N
161	128	51	Agua maria	1	50	50	pendiente	2026-04-05 03:24:21.406286+00	\N	solicitado	\N
163	131	1	presi light gr 	1	200	200	pendiente	2026-04-05 03:42:44.131819+00	\N	solicitado	\N
144	120	1	presi light gr 	2	200	400	pendiente	2026-04-04 23:21:07.884834+00	\N	solicitado	\N
142	114	30	kings pride	2	200	400	pendiente	2026-04-04 22:54:49.740472+00	\N	solicitado	\N
135	114	3	presi normal peq	3	150	450	pendiente	2026-04-04 21:35:39.57325+00	\N	solicitado	\N
164	119	30	kings pride	1	200	200	pendiente	2026-04-05 03:43:10.27997+00	\N	solicitado	\N
159	129	5	corona	3	200	600	pendiente	2026-04-05 03:01:49.138325+00	\N	solicitado	\N
133	114	10	rell bull	2	200	400	pendiente	2026-04-04 21:24:48.962204+00	\N	solicitado	\N
146	122	1	presi light gr 	1	200	200	pendiente	2026-04-05 00:06:56.566097+00	\N	solicitado	\N
177	143	1	presi light gr 	1	200	200	pendiente	2026-04-09 22:33:50.256593+00	\N	solicitado	\N
145	121	9	one gra	2	200	400	pendiente	2026-04-05 00:02:11.477846+00	\N	solicitado	\N
143	114	1	presi light gr 	10	200	2000	pendiente	2026-04-04 23:04:04.012666+00	\N	solicitado	\N
147	123	1	presi light gr 	1	200	200	pendiente	2026-04-05 00:32:49.954723+00	\N	solicitado	\N
132	114	4	presi light peq	3	150	450	pendiente	2026-04-04 21:19:59.820708+00	\N	solicitado	\N
165	132	1	presi light gr 	1	200	200	pendiente	2026-04-05 03:59:50.836092+00	\N	solicitado	\N
166	133	30	kings pride	1	200	200	pendiente	2026-04-05 04:01:41.738557+00	\N	solicitado	\N
150	111	9	one gra	1	200	200	pendiente	2026-04-05 01:17:02.36902+00	\N	solicitado	\N
151	111	1	presi light gr 	1	200	200	pendiente	2026-04-05 01:17:03.09508+00	\N	solicitado	\N
186	151	1	presi light gr 	1	200	200	pendiente	2026-04-11 00:56:33.948743+00	\N	solicitado	\N
167	134	1	presi light gr 	1	200	200	pendiente	2026-04-05 04:13:59.455495+00	\N	solicitado	\N
178	143	2	presi normal gr	1	200	200	pendiente	2026-04-09 23:12:55.589118+00	\N	solicitado	\N
152	119	9	one gra	1	200	200	pendiente	2026-04-05 01:48:10.851103+00	\N	solicitado	\N
153	126	9	one gra	1	200	200	pendiente	2026-04-05 01:53:29.066285+00	\N	solicitado	\N
154	126	1	presi light gr 	1	200	200	pendiente	2026-04-05 01:53:29.786965+00	\N	solicitado	\N
162	130	1	presi light gr 	3	200	600	pendiente	2026-04-05 03:41:48.785582+00	\N	solicitado	\N
187	152	2	presi normal gr	1	200	200	pendiente	2026-04-11 01:08:57.472686+00	\N	solicitado	\N
148	124	1	presi light gr 	2	200	400	pendiente	2026-04-05 00:48:15.128257+00	\N	solicitado	\N
188	152	53	Smirnoff	1	225	225	pendiente	2026-04-11 01:08:58.214762+00	\N	solicitado	\N
155	127	1	presi light gr 	1	200	200	pendiente	2026-04-05 02:24:58.983516+00	\N	solicitado	\N
141	119	1	presi light gr 	4	200	800	pendiente	2026-04-04 22:51:59.092074+00	\N	solicitado	\N
168	135	1	presi light gr 	1	200	200	pendiente	2026-04-05 04:36:20.273684+00	\N	solicitado	\N
156	126	2	presi normal gr	2	200	400	pendiente	2026-04-05 02:40:05.672491+00	\N	solicitado	\N
169	136	1	presi light gr 	2	200	400	pendiente	2026-04-05 04:59:40.301398+00	\N	solicitado	\N
160	119	2	presi normal gr	4	200	800	pendiente	2026-04-05 03:06:24.774698+00	\N	solicitado	\N
170	137	2	presi normal gr	6	200	1200	pendiente	2026-04-05 23:35:48.970855+00	\N	solicitado	\N
179	144	2	presi normal gr	1	200	200	pendiente	2026-04-09 23:56:47.316798+00	\N	solicitado	\N
176	142	2	presi normal gr	5	200	1000	pendiente	2026-04-09 22:33:19.507825+00	\N	solicitado	\N
172	139	2	presi normal gr	2	200	400	pendiente	2026-04-06 01:41:25.472948+00	\N	solicitado	\N
171	138	2	presi normal gr	4	200	800	pendiente	2026-04-06 00:30:36.522779+00	\N	solicitado	\N
173	140	1	presi light gr 	1	200	200	pendiente	2026-04-06 23:30:30.956969+00	\N	solicitado	\N
180	145	2	presi normal gr	4	200	800	pendiente	2026-04-10 00:19:54.822261+00	\N	solicitado	\N
182	147	2	presi normal gr	1	200	200	pendiente	2026-04-10 00:57:14.066927+00	\N	solicitado	\N
181	146	2	presi normal gr	2	200	400	pendiente	2026-04-10 00:54:45.339258+00	\N	solicitado	\N
183	148	2	presi normal gr	1	200	200	pendiente	2026-04-10 01:32:14.847063+00	\N	solicitado	\N
184	149	2	presi normal gr	1	200	200	pendiente	2026-04-10 22:18:15.227755+00	\N	solicitado	\N
185	150	2	presi normal gr	1	200	200	pendiente	2026-04-10 22:18:48.098064+00	\N	solicitado	\N
189	153	2	presi normal gr	1	200	200	pendiente	2026-04-11 01:34:24.809941+00	\N	solicitado	\N
190	154	2	presi normal gr	3	200	600	pendiente	2026-04-11 02:25:32.010765+00	\N	solicitado	\N
191	155	2	presi normal gr	1	200	200	pendiente	2026-04-11 20:40:28.292553+00	\N	solicitado	\N
193	157	47	Doble reserva pq	1	750	750	pendiente	2026-04-11 21:52:54.280621+00	\N	solicitado	\N
192	156	2	presi normal gr	3	200	600	pendiente	2026-04-11 20:40:56.3226+00	\N	solicitado	\N
194	157	14	jugo motts	1	300	300	pendiente	2026-04-11 21:52:54.985193+00	\N	solicitado	\N
195	157	12	seven up	1	50	50	pendiente	2026-04-11 21:56:41.577398+00	\N	solicitado	\N
196	157	10	rell bull	1	200	200	pendiente	2026-04-11 21:56:42.279679+00	\N	solicitado	\N
197	158	2	presi normal gr	2	200	400	pendiente	2026-04-11 22:01:36.455132+00	\N	solicitado	\N
198	159	2	presi normal gr	1	200	200	pendiente	2026-04-11 22:44:50.184215+00	\N	solicitado	\N
199	160	30	kings pride	1	200	200	pendiente	2026-04-11 22:50:31.441273+00	\N	solicitado	\N
200	161	2	presi normal gr	2	200	400	pendiente	2026-04-11 23:06:20.99394+00	\N	solicitado	\N
202	163	2	presi normal gr	1	200	200	pendiente	2026-04-11 23:41:22.14623+00	\N	solicitado	\N
203	157	30	kings pride	1	200	200	pendiente	2026-04-11 23:45:47.6735+00	\N	solicitado	\N
201	162	2	presi normal gr	2	200	400	pendiente	2026-04-11 23:36:51.035813+00	\N	solicitado	\N
205	162	1	presi light gr 	1	200	200	pendiente	2026-04-11 23:59:12.53232+00	\N	solicitado	\N
204	157	2	presi normal gr	2	200	400	pendiente	2026-04-11 23:45:48.477555+00	\N	solicitado	\N
206	164	9	one gra	1	200	200	pendiente	2026-04-12 20:23:30.860178+00	\N	solicitado	\N
208	166	5	corona	1	200	200	pendiente	2026-04-12 20:34:00.938046+00	\N	solicitado	\N
209	165	2	presi normal gr	2	200	400	pendiente	2026-04-12 20:45:57.595634+00	\N	solicitado	\N
210	167	2	presi normal gr	1	200	200	pendiente	2026-04-12 20:46:47.918814+00	\N	solicitado	\N
211	168	2	presi normal gr	2	200	400	pendiente	2026-04-12 20:48:56.952785+00	\N	solicitado	\N
212	169	9	one gra	1	200	200	pendiente	2026-04-12 20:49:11.93177+00	\N	solicitado	\N
213	170	2	presi normal gr	1	200	200	pendiente	2026-04-12 20:50:08.585186+00	\N	solicitado	\N
214	168	5	corona	1	200	200	pendiente	2026-04-12 20:51:15.237426+00	\N	solicitado	\N
215	171	9	one gra	1	200	200	pendiente	2026-04-12 21:10:21.537705+00	\N	solicitado	\N
216	173	9	one gra	1	200	200	pendiente	2026-04-12 21:47:29.988201+00	\N	solicitado	\N
217	170	1	presi light gr 	1	200	200	pendiente	2026-04-12 21:49:07.411972+00	\N	solicitado	\N
218	174	9	one gra	1	200	200	pendiente	2026-04-12 22:15:27.117663+00	\N	solicitado	\N
219	175	2	presi normal gr	1	200	200	pendiente	2026-04-12 22:23:15.659604+00	\N	solicitado	\N
220	176	47	Doble reserva pq	1	750	750	pendiente	2026-04-12 22:27:29.051195+00	\N	solicitado	\N
221	176	14	jugo motts	1	300	300	pendiente	2026-04-12 22:27:29.807636+00	\N	solicitado	\N
223	176	56	Clorets	1	15	15	pendiente	2026-04-12 22:27:31.123906+00	\N	solicitado	\N
222	176	51	Agua maria	3	50	150	pendiente	2026-04-12 22:27:30.465908+00	\N	solicitado	\N
225	178	5	corona	1	200	200	pendiente	2026-04-12 23:41:03.168392+00	\N	solicitado	\N
240	183	2	presi normal gr	1	200	200	pendiente	2026-04-13 02:26:57.432372+00	\N	solicitado	\N
241	189	8	modelo peq	1	200	200	pendiente	2026-04-13 02:56:02.869398+00	\N	solicitado	\N
231	183	4	presi light peq	2	150	300	pendiente	2026-04-13 00:40:41.168188+00	\N	solicitado	\N
227	180	6	one peq	2	150	300	pendiente	2026-04-13 00:15:55.417679+00	\N	solicitado	\N
228	180	2	presi normal gr	2	200	400	pendiente	2026-04-13 00:32:37.812733+00	\N	solicitado	\N
232	184	2	presi normal gr	1	200	200	pendiente	2026-04-13 00:44:15.141369+00	\N	solicitado	\N
233	185	2	presi normal gr	3	200	600	pendiente	2026-04-13 00:52:14.905772+00	\N	solicitado	\N
242	190	2	presi normal gr	2	200	400	pendiente	2026-04-13 21:17:51.059462+00	\N	solicitado	\N
226	179	1	presi light gr 	4	200	800	pendiente	2026-04-12 23:44:34.17465+00	\N	solicitado	\N
224	177	2	presi normal gr	6	200	1200	pendiente	2026-04-12 23:36:45.089281+00	\N	solicitado	\N
230	182	2	presi normal gr	2	200	400	pendiente	2026-04-13 00:39:39.158343+00	\N	solicitado	\N
234	179	2	presi normal gr	2	200	400	pendiente	2026-04-13 01:05:07.932841+00	\N	solicitado	\N
235	186	2	presi normal gr	2	200	400	pendiente	2026-04-13 01:33:11.112225+00	\N	solicitado	\N
236	187	2	presi normal gr	1	200	200	pendiente	2026-04-13 02:06:18.427574+00	\N	solicitado	\N
237	187	9	one gra	1	200	200	pendiente	2026-04-13 02:06:19.19023+00	\N	solicitado	\N
238	188	9	one gra	1	200	200	pendiente	2026-04-13 02:22:47.012383+00	\N	solicitado	\N
239	188	1	presi light gr 	1	200	200	pendiente	2026-04-13 02:22:47.731671+00	\N	solicitado	\N
243	191	2	presi normal gr	1	200	200	pendiente	2026-04-13 23:24:46.154903+00	\N	solicitado	\N
244	192	2	presi normal gr	1	200	200	pendiente	2026-04-15 01:34:15.428719+00	\N	solicitado	\N
246	194	2	presi normal gr	1	200	200	pendiente	2026-04-15 01:35:14.088864+00	\N	solicitado	\N
247	195	31	Extraviejo peq	1	600	600	pendiente	2026-04-15 01:36:43.724561+00	\N	solicitado	\N
248	195	14	jugo motts	1	300	300	pendiente	2026-04-15 01:36:44.438599+00	\N	solicitado	\N
249	195	1	presi light gr 	1	200	200	pendiente	2026-04-15 01:36:45.113967+00	\N	solicitado	\N
250	196	12	seven up	1	50	50	pendiente	2026-04-15 01:37:08.995276+00	\N	solicitado	\N
253	197	2	presi normal gr	1	200	200	pendiente	2026-04-15 03:03:20.792181+00	\N	solicitado	\N
254	196	30	kings pride	1	200	200	pendiente	2026-04-15 03:15:07.490629+00	\N	solicitado	\N
251	196	31	Extraviejo peq	1	600	600	pendiente	2026-04-15 02:09:38.858638+00	\N	solicitado	\N
252	194	1	presi light gr 	1	200	200	pendiente	2026-04-15 02:28:53.026178+00	\N	solicitado	\N
245	193	2	presi normal gr	6	200	1200	pendiente	2026-04-15 01:34:24.669844+00	\N	solicitado	\N
255	198	2	presi normal gr	1	200	200	pendiente	2026-04-15 21:02:22.247257+00	\N	solicitado	\N
257	199	1	presi light gr 	4	200	800	pendiente	2026-04-16 02:30:49.197458+00	\N	solicitado	\N
258	200	2	presi normal gr	3	200	600	pendiente	2026-04-16 02:31:16.585315+00	\N	solicitado	\N
263	204	9	one gra	1	200	200	pendiente	2026-04-16 22:30:33.57215+00	\N	solicitado	\N
260	203	6	one peq	3	150	450	pendiente	2026-04-16 22:24:19.69801+00	\N	solicitado	\N
264	203	9	one gra	2	200	400	pendiente	2026-04-16 22:53:16.601547+00	\N	solicitado	\N
265	205	9	one gra	1	200	200	pendiente	2026-04-16 22:53:35.054436+00	\N	solicitado	\N
266	206	2	presi normal gr	3	200	600	pendiente	2026-04-17 00:10:49.530349+00	\N	solicitado	\N
268	210	1	presi light gr 	1	200	200	pendiente	2026-04-17 22:11:53.695179+00	\N	solicitado	\N
267	209	9	one gra	2	200	400	pendiente	2026-04-17 22:03:28.448016+00	\N	solicitado	\N
269	211	9	one gra	1	200	200	pendiente	2026-04-17 22:36:58.641218+00	\N	solicitado	\N
271	213	1	presi light gr 	1	200	200	pendiente	2026-04-17 22:41:22.728822+00	\N	solicitado	\N
272	214	1	presi light gr 	1	200	200	pendiente	2026-04-17 23:09:01.032307+00	\N	solicitado	\N
305	257	10	rell bull	1	200	200	pendiente	2026-04-25 02:33:22.500195+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
270	212	9	one gra	2	200	400	pendiente	2026-04-17 22:39:37.610818+00	\N	solicitado	\N
273	215	1	presi light gr 	3	200	600	pendiente	2026-04-17 23:17:36.022517+00	\N	solicitado	\N
321	269	12	seven up	1	50	50	pendiente	2026-04-26 02:37:54.840246+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
274	216	1	presi light gr 	4	200	800	pendiente	2026-04-18 00:43:57.829582+00	\N	solicitado	\N
275	218	1	presi light gr 	1	200	200	pendiente	2026-04-18 21:14:06.75917+00	\N	solicitado	\N
277	221	1	presi light gr 	1	200	200	pendiente	2026-04-18 22:12:34.796152+00	\N	solicitado	\N
276	220	1	presi light gr 	4	200	800	pendiente	2026-04-18 22:12:00.434484+00	\N	solicitado	\N
304	259	5	corona	3	200	600	pendiente	2026-04-25 02:22:49.091724+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
278	222	9	one gra	3	200	600	pendiente	2026-04-19 00:49:03.466241+00	\N	solicitado	\N
280	225	9	one gra	1	200	200	pendiente	2026-04-19 01:43:34.279564+00	\N	solicitado	\N
307	259	9	one gra	1	200	200	pendiente	2026-04-25 03:08:26.449096+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
279	224	9	one gra	3	200	600	pendiente	2026-04-19 01:34:22.869467+00	\N	solicitado	\N
281	226	9	one gra	1	200	200	pendiente	2026-04-19 02:22:43.234313+00	\N	solicitado	\N
282	227	9	one gra	1	200	200	pendiente	2026-04-19 02:44:50.698988+00	\N	solicitado	\N
283	228	1	presi light gr 	2	200	400	pendiente	2026-04-19 20:18:12.413692+00	\N	solicitado	\N
284	229	1	presi light gr 	1	200	200	pendiente	2026-04-19 22:51:50.358486+00	\N	solicitado	\N
308	261	5	corona	2	200	400	pendiente	2026-04-25 03:17:32.386955+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
286	230	51	Agua maria	1	50	50	pendiente	2026-04-20 00:38:33.716811+00	\N	solicitado	\N
285	230	2	presi normal gr	3	200	600	pendiente	2026-04-20 00:00:44.667699+00	\N	solicitado	\N
287	231	1	presi light gr 	2	200	400	pendiente	2026-04-20 23:05:16.158187+00	\N	solicitado	\N
288	233	2	presi normal gr	1	200	200	pendiente	2026-04-20 23:28:26.169272+00	\N	solicitado	\N
289	234	57	Gatarade	1	100	100	pendiente	2026-04-20 23:39:56.496413+00	\N	solicitado	\N
290	234	2	presi normal gr	1	200	200	pendiente	2026-04-20 23:39:57.328082+00	\N	solicitado	\N
291	236	6	one peq	1	150	150	pendiente	2026-04-21 23:05:56.522887+00	\N	solicitado	\N
292	246	56	Clorets	1	15	15	pendiente	2026-04-23 12:35:40.518169+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
293	248	54	Shot	1	175	175	pendiente	2026-04-23 12:36:13.394416+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
294	251	2	presi normal gr	1	200	200	pendiente	2026-04-23 22:41:42.021632+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
295	252	1	presi light gr 	1	200	200	pendiente	2026-04-23 23:15:55.22742+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
296	253	1	presi light gr 	1	200	200	pendiente	2026-04-24 20:37:22.075087+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
297	254	1	presi light gr 	1	200	200	pendiente	2026-04-24 20:37:36.167204+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
298	256	1	presi light gr 	1	200	200	pendiente	2026-04-25 01:11:45.148045+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
300	257	38	Leyenda azul	1	1800	1800	pendiente	2026-04-25 01:12:42.488613+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
309	261	9	one gra	1	200	200	pendiente	2026-04-25 03:17:33.116146+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
314	266	56	Clorets	1	15	15	pendiente	2026-04-25 23:08:39.372048+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
315	267	35	Doble reserva	1	1500	1500	pendiente	2026-04-25 23:09:10.501637+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
316	267	14	jugo motts	1	300	300	pendiente	2026-04-25 23:09:11.237572+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
299	257	4	presi light peq	3	150	450	pendiente	2026-04-25 01:12:41.590188+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
313	266	1	presi light gr 	6	200	1200	pendiente	2026-04-25 22:26:48.266836+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
303	258	30	kings pride	2	200	400	pendiente	2026-04-25 02:16:20.127666+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
302	258	2	presi normal gr	7	200	1400	pendiente	2026-04-25 01:16:56.730692+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
301	258	1	presi light gr 	5	200	1000	pendiente	2026-04-25 01:16:55.951162+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
306	258	10	rell bull	2	200	400	pendiente	2026-04-25 02:34:43.260611+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
310	264	9	one gra	1	200	200	pendiente	2026-04-25 21:03:53.56044+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
311	263	2	presi normal gr	2	200	400	pendiente	2026-04-25 21:05:53.464171+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
312	265	57	Gatarade	1	100	100	pendiente	2026-04-25 22:11:19.220538+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
322	269	11	enriquillo sosa 	1	75	75	pendiente	2026-04-26 02:37:55.464112+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
318	267	1	presi light gr 	1	200	200	pendiente	2026-04-26 00:26:36.621984+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
317	267	51	Agua maria	2	50	100	pendiente	2026-04-25 23:43:23.131905+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
320	269	35	Doble reserva	1	1500	1500	pendiente	2026-04-26 02:37:53.982028+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
323	270	1	presi light gr 	2	200	400	pendiente	2026-04-26 03:00:15.222217+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
319	268	2	presi normal gr	3	200	600	pendiente	2026-04-26 02:15:44.332638+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
325	270	11	enriquillo sosa 	1	75	75	pendiente	2026-04-26 03:18:30.340068+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
326	270	57	Gatarade	1	100	100	pendiente	2026-04-26 03:18:30.970926+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
327	265	2	presi normal gr	1	200	200	pendiente	2026-04-26 03:18:54.117704+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
328	271	9	one gra	4	200	800	pendiente	2026-04-26 21:40:25.5502+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
329	271	13	911	1	100	100	pendiente	2026-04-26 22:52:39.861766+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
330	272	2	presi normal gr	1	200	200	pendiente	2026-04-27 22:58:31.348037+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
331	273	1	presi light gr 	5	200	1000	pendiente	2026-04-28 23:50:10.013476+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
332	274	2	presi normal gr	3	200	600	pendiente	2026-04-28 23:50:40.155715+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
333	274	4	presi light peq	1	150	150	pendiente	2026-04-29 00:59:44.674774+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
334	275	1	presi light gr 	4	200	800	pendiente	2026-04-30 23:32:26.240803+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
336	277	2	presi normal gr	4	200	800	pendiente	2026-04-30 23:34:12.290305+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
335	276	2	presi normal gr	4	200	800	pendiente	2026-04-30 23:33:58.589151+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
337	278	1	presi light gr 	1	200	200	pendiente	2026-05-01 23:18:06.907316+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
338	279	2	presi normal gr	3	200	600	pendiente	2026-05-02 00:53:10.679903+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
339	280	1	presi light gr 	2	200	400	pendiente	2026-05-02 02:33:19.509305+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
340	283	2	presi normal gr	4	200	800	pendiente	2026-05-02 23:35:04.959866+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
341	284	9	one gra	3	200	600	pendiente	2026-05-03 01:26:36.206541+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
344	286	34	añejo peq	1	600	600	pendiente	2026-05-03 01:48:20.969155+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
346	286	12	seven up	1	50	50	pendiente	2026-05-03 01:53:43.910871+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
343	286	1	presi light gr 	3	200	600	pendiente	2026-05-03 01:27:28.767841+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
347	288	1	presi light gr 	1	200	200	pendiente	2026-05-03 02:11:18.462577+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
342	285	1	presi light gr 	3	200	600	pendiente	2026-05-03 01:27:03.196166+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
349	289	54	Shot Tequila	1	175	175	pendiente	2026-05-03 02:31:14.849072+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
348	289	6	one peq	2	150	300	pendiente	2026-05-03 02:31:13.692538+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
345	287	1	presi light gr 	5	200	1000	pendiente	2026-05-03 01:52:05.162545+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
350	290	1	presi light gr 	1	200	200	pendiente	2026-05-03 03:28:48.961949+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
351	295	2	presi normal gr	1	200	200	pendiente	2026-05-06 00:37:46.012477+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
352	298	1	presi light gr 	1	200	200	pendiente	2026-05-06 23:18:15.59076+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
353	298	2	presi normal gr	3	200	600	pendiente	2026-05-06 23:18:16.319459+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
354	299	2	presi normal gr	1	200	200	pendiente	2026-05-07 02:35:49.334729+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
355	300	2	presi normal gr	3	200	600	pendiente	2026-05-07 02:36:12.971886+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
356	301	2	Presidents Gr Normal	3	200	600	pendiente	2026-05-12 23:56:57.352039+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
357	302	2	Presidents Gr Normal	3	200	600	pendiente	2026-05-12 23:57:17.803518+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
358	303	2	Presidents Gr Normal	3	200	600	pendiente	2026-05-12 23:58:16.693969+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
359	303	3	Presidente Peq Normal	2	150	300	pendiente	2026-05-12 23:58:17.459917+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
360	304	35	Doble reserva	1	1500	1500	pendiente	2026-05-12 23:59:01.744939+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
361	304	14	Jugo Motts	1	300	300	pendiente	2026-05-12 23:59:02.520625+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
362	307	2	Presi Gr Normal	2	200	400	pendiente	2026-05-14 01:48:36.591645+00	\N	solicitado	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, nombre, descripcion, precio_compra, precio_venta, stock_actual, stock_minimo, categoria_id, codigo_barras, sku, imagen_url, activo, created_at, unidad, imagen_nombre, updated_at, unidad_medida, negocio_id) FROM stdin;
58	Vodka Absolut	\N	1600	2500	1	1	6	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-58-1777137041305.png	t	2026-04-25 16:56:12.645626+00	Unidad	producto-58-1777137041305.png	2026-04-25 17:10:43.399+00	Unidad	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
7	Stella Artois 	\N	128	200	24	5	1	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-7-1772060793832.webp	t	2026-02-25 23:05:48.853093+00	Unidad	producto-7-1772060793832.webp	2026-05-09 20:28:36.082+00	Unidad	11111111-1111-1111-1111-111111111111
59	Aloe Vera	\N	77	150	20	5	8	\N	\N	\N	t	2026-04-29 22:43:48.685009+00	Unidad	\N	2026-04-29 22:55:13.447+00	Unidad	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
15	Gramberry	\N	194	350	5	2	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772062569076.webp	t	2026-02-25 23:36:09.226932+00	Unidad	producto-temp-1772062569076.webp	2026-05-09 20:31:16.383+00	Unidad	11111111-1111-1111-1111-111111111111
35	Doble reserva	\N	800	1500	8	2	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-35-1774555732219.webp	t	2026-03-05 00:19:52.943082+00	Unidad	producto-35-1774555732219.webp	2026-04-04 18:33:50.18+00	Unidad	11111111-1111-1111-1111-111111111111
13	911	\N	36	100	6	3	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772062187585.jpg	t	2026-02-25 23:29:48.550698+00	Unidad	producto-temp-1772062187585.jpg	2026-02-26 15:50:30.346+00	Unidad	11111111-1111-1111-1111-111111111111
20	chiva real 12	\N	2057	3000	1	1	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772063371297.webp	t	2026-02-25 23:49:31.483953+00	Unidad	producto-temp-1772063371297.webp	2026-02-26 15:47:51.595+00	Unidad	11111111-1111-1111-1111-111111111111
29	bodka cayman blue	\N	721	1600	3	1	6	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772065102120.jpg	t	2026-02-26 00:18:22.038152+00	Unidad	producto-temp-1772065102120.jpg	2026-02-26 15:44:55.834+00	Unidad	11111111-1111-1111-1111-111111111111
28	stolichnaya vodka 	\N	919	2200	4	2	6	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772064973595.webp	t	2026-02-26 00:16:13.273579+00	Unidad	producto-temp-1772064973595.webp	2026-02-26 15:45:06.779+00	Unidad	11111111-1111-1111-1111-111111111111
27	fireball peq	\N	95	250	10	5	3	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772064871034.webp	t	2026-02-26 00:14:30.743438+00	Unidad	producto-temp-1772064871034.webp	2026-02-26 15:45:17.632+00	Unidad	11111111-1111-1111-1111-111111111111
26	fireball medi	\N	431	1000	3	1	3	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772064701394.webp	t	2026-02-26 00:11:41.650338+00	Unidad	producto-temp-1772064701394.webp	2026-02-26 15:45:27.503+00	Unidad	11111111-1111-1111-1111-111111111111
25	william lawsons	\N	769	1500	1	1	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772064479917.webp	t	2026-02-26 00:08:00.013784+00	Unidad	producto-temp-1772064479917.webp	2026-02-26 15:45:36.801+00	Unidad	11111111-1111-1111-1111-111111111111
24	fireball	\N	1344	2200	3	1	3	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772064322436.webp	t	2026-02-26 00:05:22.361363+00	Unidad	producto-temp-1772064322436.webp	2026-02-26 15:45:51.338+00	Unidad	11111111-1111-1111-1111-111111111111
23	mack albert peq	\N	291	500	3	1	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772064223851.jpg	t	2026-02-26 00:03:44.11681+00	Unidad	producto-temp-1772064223851.jpg	2026-02-26 15:46:19.255+00	Unidad	11111111-1111-1111-1111-111111111111
22	king label negro gra	\N	608	1200	5	2	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772064062154.webp	t	2026-02-26 00:01:02.683398+00	Unidad	producto-temp-1772064062154.webp	2026-02-26 15:46:28.872+00	Unidad	11111111-1111-1111-1111-111111111111
21	something special 	\N	817	1800	2	1	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772063585274.webp	t	2026-02-25 23:53:05.551324+00	Unidad	producto-temp-1772063585274.webp	2026-02-26 15:46:39.932+00	Unidad	11111111-1111-1111-1111-111111111111
19	deward 12 white	\N	789	1500	2	1	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772063250430.webp	t	2026-02-25 23:47:30.292415+00	Unidad	producto-temp-1772063250430.webp	2026-02-26 15:48:24.668+00	Unidad	11111111-1111-1111-1111-111111111111
34	añejo peq	\N	280	600	17	2	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-34-1774555674594.png	t	2026-03-05 00:17:50.526443+00	Unidad	producto-34-1774555674594.png	2026-04-25 16:48:58.543+00	Unidad	11111111-1111-1111-1111-111111111111
32	Extraviejo gr	\N	580	1100	5	2	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-32-1774555367897.jpg	t	2026-03-05 00:12:43.364393+00	Unidad	producto-32-1774555367897.jpg	2026-03-26 20:02:48.49+00	Unidad	11111111-1111-1111-1111-111111111111
6	One Pequeña	\N	74	150	105	24	1	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772060549582.webp	t	2026-02-25 23:02:29.473137+00	Unidad	producto-temp-1772060549582.webp	2026-05-09 20:26:52.439+00	Unidad	11111111-1111-1111-1111-111111111111
8	Modelo pequeña	\N	114	200	20	5	1	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772060927018.jpg	t	2026-02-25 23:08:47.384296+00	Unidad	producto-temp-1772060927018.jpg	2026-05-09 20:28:13.636+00	Unidad	11111111-1111-1111-1111-111111111111
2	Presi Gr Normal	\N	140	200	398	16	1	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-2-1772059042232.webp	t	2026-02-25 22:33:06.109501+00	Unidad	producto-2-1772059042232.webp	2026-05-13 20:49:01.527+00	Unidad	11111111-1111-1111-1111-111111111111
44	Jose Cuervo bco	\N	1555	2500	2	1	2	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-44-1774557618397.webp	t	2026-03-26 20:26:07.528323+00	Unidad	producto-44-1774557618397.webp	2026-04-25 16:52:56.724+00	Unidad	11111111-1111-1111-1111-111111111111
3	Presi Peq Normal	\N	85	150	141	24	1	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-3-1772059853010.webp	t	2026-02-25 22:47:54.435004+00	Unidad	producto-3-1772059853010.webp	2026-05-13 20:48:18.071+00	Unidad	11111111-1111-1111-1111-111111111111
14	Jugo Motts	\N	170	300	6	3	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772062377456.webp	t	2026-02-25 23:32:57.830229+00	Unidad	producto-temp-1772062377456.webp	2026-05-09 20:30:39.243+00	Unidad	11111111-1111-1111-1111-111111111111
31	Extraviejo peq	\N	296	600	14	2	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-31-1774555308292.webp	t	2026-03-05 00:09:39.15816+00	Unidad	producto-31-1774555308292.webp	2026-04-25 16:51:29.078+00	Unidad	11111111-1111-1111-1111-111111111111
4	Presi Peq Light	\N	75	150	199	24	1	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-4-1772060031093.jpg	t	2026-02-25 22:52:47.050337+00	Unidad	producto-4-1772060031093.jpg	2026-05-13 20:47:44.442+00	Unidad	11111111-1111-1111-1111-111111111111
10	Rell Bull	\N	79	200	9	5	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772061419640.webp	t	2026-02-25 23:16:59.81945+00	Unidad	producto-temp-1772061419640.webp	2026-05-09 20:29:18.282+00	Unidad	11111111-1111-1111-1111-111111111111
11	Enriquillo Soda	\N	15	75	12	5	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772061651847.png	t	2026-02-25 23:20:52.292961+00	Unidad	producto-temp-1772061651847.png	2026-05-09 20:29:51.781+00	Unidad	11111111-1111-1111-1111-111111111111
12	Seven Up	\N	15	50	38	5	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772061924017.webp	t	2026-02-25 23:25:24.251194+00	Unidad	producto-temp-1772061924017.webp	2026-05-09 20:30:15.394+00	Unidad	11111111-1111-1111-1111-111111111111
16	Carlos Rossy	\N	424	900	6	1	4	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772062781212.webp	t	2026-02-25 23:39:41.35773+00	Unidad	producto-temp-1772062781212.webp	2026-05-09 20:31:42.321+00	Unidad	11111111-1111-1111-1111-111111111111
5	Corona	\N	115	200	39	16	1	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772060282370.png	t	2026-02-25 22:58:03.012648+00	Unidad	producto-temp-1772060282370.png	2026-05-09 20:34:08.966+00	Unidad	11111111-1111-1111-1111-111111111111
18	King Label Grande	\N	516	1000	5	2	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772063133730.webp	t	2026-02-25 23:45:33.763198+00	Unidad	producto-temp-1772063133730.webp	2026-05-09 20:33:14.283+00	Unidad	11111111-1111-1111-1111-111111111111
17	King Label Pequeño	\N	265	500	5	2	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772062989122.webp	t	2026-02-25 23:43:09.364208+00	Unidad	producto-temp-1772062989122.webp	2026-05-09 20:33:31.546+00	Unidad	11111111-1111-1111-1111-111111111111
45	Brugal XV gr	\N	620	1300	3	2	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-45-1774557782535.webp	t	2026-03-26 20:38:50.955796+00	Unidad	producto-45-1774557782535.webp	2026-03-26 20:43:04.161+00	Unidad	11111111-1111-1111-1111-111111111111
36	Triple Reserva	\N	910	1700	2	1	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-36-1774555747254.webp	t	2026-03-26 20:00:48.209662+00	Unidad	producto-36-1774555747254.webp	2026-03-26 20:09:07.772+00	Unidad	11111111-1111-1111-1111-111111111111
37	Legenda aniversario	\N	1325	2000	1	1	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-37-1774555850363.webp	t	2026-03-26 20:05:42.569869+00	Unidad	producto-37-1774555850363.webp	2026-03-26 20:10:51.171+00	Unidad	11111111-1111-1111-1111-111111111111
40	Buchanans	\N	2525	3800	2	1	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-40-1774557209446.webp	t	2026-03-26 20:15:56.263185+00	Unidad	producto-40-1774557209446.webp	2026-03-26 20:33:30.501+00	Unidad	11111111-1111-1111-1111-111111111111
41	Johnnie walker black	\N	2175	3500	2	1	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-41-1774557337483.webp	t	2026-03-26 20:17:31.540037+00	Unidad	producto-41-1774557337483.webp	2026-03-26 20:35:38.4+00	Unidad	11111111-1111-1111-1111-111111111111
43	Johnnie gold	\N	4050	6000	1	1	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-43-1774557457387.jpg	t	2026-03-26 20:20:58.05692+00	Unidad	producto-43-1774557457387.jpg	2026-03-26 20:37:38.72+00	Unidad	11111111-1111-1111-1111-111111111111
46	Brugal XV pq	\N	335	650	4	2	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-46-1774558431196.webp	t	2026-03-26 20:45:28.265394+00	Unidad	producto-46-1774558431196.webp	2026-03-26 20:53:52.004+00	Unidad	11111111-1111-1111-1111-111111111111
48	Barcelo gran anejo	\N	550	1000	1	1	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-48-1774558664861.webp	t	2026-03-26 20:50:03.12634+00	Unidad	producto-48-1774558664861.webp	2026-03-26 20:57:45.714+00	Unidad	11111111-1111-1111-1111-111111111111
49	Barcelo gran anejo pq	\N	280	600	1	1	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-49-1774558679288.webp	t	2026-03-26 20:51:41.239159+00	Unidad	producto-49-1774558679288.webp	2026-03-26 20:57:59.779+00	Unidad	11111111-1111-1111-1111-111111111111
30	kings pride	\N	130	200	29	5	3	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772065440560.webp	t	2026-02-26 00:24:00.68026+00	Unidad	producto-temp-1772065440560.webp	2026-04-02 20:39:16.027+00	Unidad	11111111-1111-1111-1111-111111111111
54	Shot Tequila	\N	1555	175	20	5	2	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-54-1776947705632.webp	t	2026-04-02 20:53:07.707374+00	Unidad	producto-54-1776947705632.webp	2026-05-01 20:41:25.756+00	Unidad	11111111-1111-1111-1111-111111111111
38	Leyenda azul	\N	1140	1800	2	1	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-38-1774555862695.webp	t	2026-03-26 20:09:07.368074+00	Unidad	producto-38-1774555862695.webp	2026-04-25 16:45:41.166+00	Unidad	11111111-1111-1111-1111-111111111111
39	Old parr 12	\N	1950	3200	2	1	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-39-1774556134079.webp	t	2026-03-26 20:13:35.347552+00	Unidad	producto-39-1774556134079.webp	2026-04-25 16:45:57.288+00	Unidad	11111111-1111-1111-1111-111111111111
56	Clorets	\N	5	15	80	20	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-56-1776947363791.webp	t	2026-04-02 21:02:40.148452+00	Unidad	producto-56-1776947363791.webp	2026-04-23 12:29:24.351+00	Unidad	11111111-1111-1111-1111-111111111111
55	Trident 	\N	25	50	0	3	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-55-1776947453964.webp	t	2026-04-02 20:56:26.677372+00	Unidad	producto-55-1776947453964.webp	2026-04-23 12:30:54.755+00	Unidad	11111111-1111-1111-1111-111111111111
1	Presi Gr Light	\N	140	200	462	16	1	\N	CER-001	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-1-1772057363362.jfif	t	2026-02-24 18:46:23.263228+00	Unidad	producto-1-1772057363362.jfif	2026-05-13 20:49:16.884+00	Unidad	11111111-1111-1111-1111-111111111111
52	Botella de Agua perrier	\N	45	125	8	3	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-52-1776947569197.webp	t	2026-04-02 20:45:32.82757+00	Unidad	producto-52-1776947569197.webp	2026-04-23 12:32:49.722+00	Unidad	11111111-1111-1111-1111-111111111111
53	Smirnoff	\N	150	225	13	5	1	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-53-1776947621913.webp	t	2026-04-02 20:49:40.800232+00	Unidad	producto-53-1776947621913.webp	2026-04-23 12:33:42.584+00	Unidad	11111111-1111-1111-1111-111111111111
51	Agua Dasani	\N	20	50	40	10	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-51-1777497640588.jpg	t	2026-04-02 20:37:52.680449+00	Unidad	producto-51-1777497640588.jpg	2026-05-03 22:07:16.292+00	Unidad	11111111-1111-1111-1111-111111111111
42	Johnnie walker Doble b	\N	2920	4000	2	1	7	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-42-1774557356747.webp	t	2026-03-26 20:19:12.384209+00	Unidad	producto-42-1774557356747.webp	2026-04-25 16:45:10.585+00	Unidad	11111111-1111-1111-1111-111111111111
47	Doble reserva pq	\N	490	750	6	2	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-47-1774558509101.webp	t	2026-03-26 20:46:41.96447+00	Unidad	producto-47-1774558509101.webp	2026-04-25 16:48:15.724+00	Unidad	11111111-1111-1111-1111-111111111111
33	añejo gr	\N	540	1100	7	2	5	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-33-1774555657566.jpg	t	2026-03-05 00:15:16.601735+00	Unidad	producto-33-1774555657566.jpg	2026-04-25 16:50:16.843+00	Unidad	11111111-1111-1111-1111-111111111111
57	Gatarade	\N	50	100	29	5	8	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-57-1776947315637.webp	t	2026-04-20 23:36:05.394252+00	Unidad	producto-57-1776947315637.webp	2026-04-29 20:37:06.068+00	Unidad	11111111-1111-1111-1111-111111111111
9	One Grande	\N	125	200	80	16	1	\N	\N	https://tisldfszcdahxqmsajfm.supabase.co/storage/v1/object/public/productos-imagenes/producto-temp-1772061243908.jpg	t	2026-02-25 23:14:04.104403+00	Unidad	producto-temp-1772061243908.jpg	2026-05-09 20:18:52.149+00	Unidad	11111111-1111-1111-1111-111111111111
\.


--
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, documento, telefono, email, direccion, contacto, activo, created_at, updated_at, tipo_documento, ciudad, pais, negocio_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, nombre, descripcion, permisos, activo, created_at, updated_at, color, negocio_id) FROM stdin;
7	admin	Administrador Global	["*"]	t	2026-04-21 20:55:35.021409+00	2026-04-21 20:55:35.021409+00	#ef4444	00000000-0000-0000-0000-000000000000
1	Super Administrador	Acceso completo al sistema	["dashboard.ver", "inventario.ver", "inventario.crear", "inventario.editar", "inventario.eliminar", "inventario.exportar", "proveedores.ver", "proveedores.crear", "proveedores.editar", "proveedores.eliminar", "clientes.ver", "clientes.crear", "clientes.editar", "clientes.eliminar", "ventas.ver", "ventas.crear", "ventas.cancelar", "ventas.historial", "ventas.exportar", "caja.ver", "caja.abrir", "caja.cerrar", "caja.movimientos", "caja.arqueo", "caja.historial", "cuentas.ver", "cuentas.pagos", "cuentas.recordatorios", "cuentas.exportar", "usuarios.ver", "usuarios.crear", "usuarios.editar", "usuarios.eliminar", "roles.ver", "roles.crear", "roles.editar", "roles.eliminar", "reportes.ventas", "reportes.inventario", "reportes.caja", "reportes.clientes", "config.general", "config.backup", "config.logs"]	t	2026-02-24 17:09:15.154232+00	2026-02-24 17:09:15.154232+00	#dc2626	11111111-1111-1111-1111-111111111111
2	Administrador	Gestión completa excepto usuarios y configuración	["dashboard.ver", "inventario.ver", "inventario.crear", "inventario.editar", "inventario.exportar", "proveedores.ver", "proveedores.crear", "proveedores.editar", "clientes.ver", "clientes.crear", "clientes.editar", "ventas.ver", "ventas.crear", "ventas.cancelar", "ventas.historial", "ventas.exportar", "caja.ver", "caja.abrir", "caja.cerrar", "caja.movimientos", "caja.arqueo", "caja.historial", "cuentas.ver", "cuentas.pagos", "cuentas.recordatorios", "cuentas.exportar", "reportes.ventas", "reportes.inventario", "reportes.caja", "reportes.clientes"]	t	2026-02-24 17:09:15.154232+00	2026-02-24 17:09:15.154232+00	#ea580c	11111111-1111-1111-1111-111111111111
4	Vendedor	Solo ventas y consultas básicas	["dashboard.ver", "inventario.ver", "clientes.ver", "clientes.crear", "ventas.ver", "ventas.crear", "cuentas.ver"]	t	2026-02-24 17:09:15.154232+00	2026-02-24 17:09:15.154232+00	#16a34a	11111111-1111-1111-1111-111111111111
5	Solo Lectura	Solo consultas, sin modificaciones	["dashboard.ver", "inventario.ver", "clientes.ver", "ventas.ver", "ventas.historial", "caja.ver", "caja.historial", "cuentas.ver"]	t	2026-02-24 17:09:15.154232+00	2026-02-24 17:09:15.154232+00	#6b7280	11111111-1111-1111-1111-111111111111
3	Cajero	Operaciones de caja y ventas	["dashboard.ver", "ventas.ver", "ventas.crear", "ventas.historial", "caja.ver", "caja.abrir", "caja.cerrar", "caja.movimientos", "caja.arqueo"]	t	2026-02-24 17:09:15.154232+00	2026-02-24 17:09:15.154232+00	#2563eb	11111111-1111-1111-1111-111111111111
\.


--
-- Data for Name: secuencias_ncf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.secuencias_ncf (id, tipo_ncf, serie, secuencia_inicio, secuencia_fin, secuencia_actual, fecha_vencimiento, activo, created_at, negocio_id) FROM stdin;
\.


--
-- Data for Name: sesiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sesiones (id, usuario_id, token, fecha_inicio, fecha_expiracion, ip_address, user_agent, activa, created_at) FROM stdin;
180	8	logos_1776808418771_ea2w9up0hr	2026-04-21 21:53:38.771+00	2026-04-22 05:53:38.771+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	f	2026-04-21 21:53:38.679191+00
181	2	logos_1776809252628_egclg1294fk	2026-04-21 22:07:32.628+00	2026-04-22 06:07:32.628+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	f	2026-04-21 22:07:32.497942+00
182	2	logos_1776809628954_q8q22ju7mui	2026-04-21 22:13:48.962+00	2026-04-22 06:13:48.954+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-21 22:13:49.137074+00
183	2	logos_1776810154158_tjegmndlodo	2026-04-21 22:22:34.158+00	2026-04-22 06:22:34.158+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36	f	2026-04-21 22:22:34.036186+00
184	2	logos_1776811346891_0olvlh9kx8mo	2026-04-21 22:42:26.891+00	2026-04-22 06:42:26.891+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-21 22:42:26.669531+00
185	2	logos_1776813249300_833pvv3qp0k	2026-04-21 23:14:09.3+00	2026-04-22 07:14:09.3+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-21 23:14:09.127889+00
186	2	logos_1776813452631_r9srh7akp3s	2026-04-21 23:17:32.631+00	2026-04-22 07:17:32.631+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-21 23:17:32.370661+00
187	2	logos_1776815179635_s31zpkp5fx	2026-04-21 23:46:19.635+00	2026-04-22 07:46:19.635+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	f	2026-04-21 23:46:19.410007+00
188	8	logos_1776816009440_cv0v9twtt29	2026-04-22 00:00:09.44+00	2026-04-22 08:00:09.44+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	f	2026-04-22 00:00:09.170029+00
189	2	logos_1776816484765_78659j4ot4	2026-04-22 00:08:04.765+00	2026-04-22 08:08:04.765+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 00:08:04.452058+00
190	2	logos_1776825083443_iozsqbt3ga	2026-04-22 02:31:23.445+00	2026-04-22 10:31:23.443+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-22 02:31:23.619811+00
191	2	logos_1776827749036_m07at9ykb0e	2026-04-22 03:15:49.037+00	2026-04-22 11:15:49.036+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-22 03:15:49.201307+00
192	2	logos_1776857181893_9cilcmea7nn	2026-04-22 11:26:21.893+00	2026-04-22 19:26:21.893+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 11:26:22.484441+00
193	2	logos_1776860649254_ywj68anq02h	2026-04-22 12:24:09.255+00	2026-04-22 20:24:09.254+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-22 12:24:09.395204+00
195	2	logos_1776862502078_ajyrb8f0xj	2026-04-22 12:55:02.079+00	2026-04-22 20:55:02.078+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	f	2026-04-22 12:55:02.598776+00
196	2	logos_1776865262005_iq0c6hd8lg	2026-04-22 13:41:02.005+00	2026-04-22 21:41:02.005+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 13:41:02.035569+00
197	2	logos_1776865326327_8rjo3oim7sn	2026-04-22 13:42:06.327+00	2026-04-22 21:42:06.327+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 13:42:06.492215+00
198	8	logos_1776865391538_9y0vgk880j9	2026-04-22 13:43:11.538+00	2026-04-22 21:43:11.538+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 13:43:11.573292+00
200	2	logos_1776867804953_t0lqu9t83yj	2026-04-22 14:23:24.953+00	2026-04-22 22:23:24.953+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 14:23:25.052354+00
199	2	logos_1776865482432_p8fc0bl0qf	2026-04-22 13:44:42.434+00	2026-04-22 21:44:42.432+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	f	2026-04-22 13:44:42.680028+00
201	2	logos_1776867914602_a0bi4ti8jl	2026-04-22 14:25:14.604+00	2026-04-22 22:25:14.602+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	f	2026-04-22 14:25:14.758563+00
202	2	logos_1776867938989_n62yc7ep6qk	2026-04-22 14:25:38.989+00	2026-04-22 22:25:38.989+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	f	2026-04-22 14:25:39.083225+00
203	2	logos_1776867958410_kvnm23kexh	2026-04-22 14:25:58.41+00	2026-04-22 22:25:58.41+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-22 14:25:58.502244+00
204	2	logos_1776868713939_gs86orhykej	2026-04-22 14:38:33.94+00	2026-04-22 22:38:33.939+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 14:38:33.956984+00
205	2	logos_1776869165918_nsgtsp7e8d	2026-04-22 14:46:05.918+00	2026-04-22 22:46:05.918+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 14:46:05.939614+00
206	2	logos_1776869406405_7kjx8zmbaqs	2026-04-22 14:50:06.405+00	2026-04-22 22:50:06.405+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	f	2026-04-22 14:50:06.405065+00
207	2	logos_1776872576059_5z5gglpticb	2026-04-22 15:42:56.059+00	2026-04-22 23:42:56.059+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 15:42:56.003283+00
208	2	logos_1776873493241_3tzyyz6953c	2026-04-22 15:58:13.241+00	2026-04-22 23:58:13.241+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 15:58:13.215766+00
209	2	logos_1776874883454_ohdgmg0pwdb	2026-04-22 16:21:23.462+00	2026-04-23 00:21:23.454+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-22 16:21:23.57664+00
194	2	logos_1776861309554_h4ge9hcg4ol	2026-04-22 12:35:09.554+00	2026-04-29 12:35:09.554+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0	f	2026-04-22 12:35:07.73716+00
211	3	logos_1776889728175_kfvrexotv97	2026-04-22 20:28:48.175+00	2026-04-23 04:28:48.175+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-22 20:29:10.360638+00
212	2	logos_1776890097936_soj8i0ty94	2026-04-22 20:34:57.944+00	2026-04-23 04:34:57.936+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-22 20:34:58.145518+00
210	2	logos_1776881507451_bdsziirymx5	2026-04-22 18:11:47.451+00	2026-04-23 02:11:47.451+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0	f	2026-04-22 18:11:45.854731+00
213	2	logos_1776890381537_kox2e2hc35	2026-04-22 20:39:41.537+00	2026-04-23 04:39:41.537+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 20:39:42.591896+00
214	2	logos_1776891273276_acyy9wvpgpn	2026-04-22 20:54:33.276+00	2026-04-23 04:54:33.276+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-22 20:54:34.350635+00
215	2	logos_1776891723046_xvujzc6zb5	2026-04-22 21:02:03.046+00	2026-04-23 05:02:03.046+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	f	2026-04-22 21:02:03.219138+00
216	3	logos_1776892203340_3xzh481knl9	2026-04-22 21:10:03.341+00	2026-04-23 05:10:03.34+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	f	2026-04-22 21:10:03.453386+00
217	2	logos_1776892744531_p9gc8113d8e	2026-04-22 21:19:04.539+00	2026-04-23 05:19:04.531+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-22 21:19:04.699346+00
218	3	logos_1776894039890_2djnc2fx78r	2026-04-22 21:40:39.891+00	2026-04-23 05:40:39.89+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	f	2026-04-22 21:40:40.048519+00
219	2	logos_1776894190994_4m5nkor9og7	2026-04-22 21:43:10.994+00	2026-04-23 05:43:10.994+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-22 21:43:11.167098+00
220	2	logos_1776897147181_5cai46vqcfo	2026-04-22 22:32:27.182+00	2026-04-23 06:32:27.181+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-22 22:32:27.397608+00
221	2	logos_1776907070563_wdc3x6xc1ek	2026-04-23 01:17:50.564+00	2026-04-23 09:17:50.563+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-23 01:17:50.940231+00
222	2	logos_1776912760368_guou400l9xq	2026-04-23 02:52:40.368+00	2026-04-23 10:52:40.368+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-23 02:52:41.559631+00
223	2	logos_1776913892626_dws098rwilj	2026-04-23 03:11:32.626+00	2026-04-23 11:11:32.626+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-23 03:11:33.695804+00
224	2	logos_1776940323563_6y24r0ihhts	2026-04-23 10:32:03.564+00	2026-04-23 18:32:03.563+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-23 10:32:03.768819+00
225	2	logos_1776947184212_slntfbhnh7	2026-04-23 12:26:24.212+00	2026-04-23 20:26:24.212+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0	f	2026-04-23 12:26:23.386537+00
226	2	logos_1776949537339_e0gwetqu0pr	2026-04-23 13:05:37.339+00	2026-04-23 21:05:37.339+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	t	2026-04-23 13:05:37.944349+00
227	2	logos_1776953282060_5h187cl1v4c	2026-04-23 14:08:02.06+00	2026-04-23 22:08:02.06+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0	t	2026-04-23 14:08:01.259951+00
228	2	logos_1776971353048_wlcqf7cqyx	2026-04-23 19:09:13.048+00	2026-04-24 03:09:13.048+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-23 19:09:13.190003+00
229	3	logos_1776972472056_nt0s4vlec6a	2026-04-23 19:27:52.056+00	2026-04-24 03:27:52.056+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-23 19:28:14.822125+00
230	2	logos_1777049027414_97em4yag0j4	2026-04-24 16:43:47.415+00	2026-04-25 00:43:47.414+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-24 16:43:47.553984+00
231	3	logos_1777060826928_c7msb81i3ri	2026-04-24 20:00:26.928+00	2026-04-25 04:00:26.928+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-24 20:00:51.016045+00
232	2	logos_1777063726280_hqu16em8ngk	2026-04-24 20:48:46.282+00	2026-04-25 04:48:46.281+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-24 20:48:46.442816+00
233	2	logos_1777114744313_wyt1vag9xw	2026-04-25 10:59:04.313+00	2026-04-25 18:59:04.313+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-25 10:59:04.560525+00
234	4	logos_1777135345434_91qlcrconz5	2026-04-25 16:42:25.434+00	2026-04-26 00:42:25.434+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-25 16:42:50.062279+00
235	3	logos_1777137164658_crt4tpb5ifn	2026-04-25 17:12:44.658+00	2026-04-26 01:12:44.658+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-25 17:13:09.830441+00
236	2	logos_1777142397862_4lokcdynpsi	2026-04-25 18:39:57.862+00	2026-04-26 02:39:57.862+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-25 18:39:57.982569+00
237	3	logos_1777149637740_lk3zaxoe6xe	2026-04-25 20:40:37.74+00	2026-04-26 04:40:37.74+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-25 20:41:02.705142+00
238	2	logos_1777164760544_qid7qwm58v	2026-04-26 00:52:40.544+00	2026-04-26 08:52:40.544+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-26 00:52:38.910566+00
239	3	logos_1777234267039_1535as96k0v	2026-04-26 20:11:07.039+00	2026-04-27 04:11:07.039+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-26 20:11:33.169163+00
240	2	logos_1777245297425_xg43uci7rbg	2026-04-26 23:14:57.431+00	2026-04-27 07:14:57.425+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-26 23:14:57.59559+00
241	2	logos_1777249362564_lc7895k4z0a	2026-04-27 00:22:42.565+00	2026-04-27 08:22:42.564+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-27 00:22:42.788517+00
242	3	logos_1777318820471_tbjqbh3ev6s	2026-04-27 19:40:20.471+00	2026-04-28 03:40:20.471+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-27 19:40:48.199362+00
243	3	logos_1777407523721_bjk6v7tj74	2026-04-28 20:18:43.721+00	2026-04-29 04:18:43.721+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-28 20:19:11.633439+00
244	4	logos_1777494476837_8ay7tl8fyew	2026-04-29 20:27:56.837+00	2026-04-30 04:27:56.837+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-29 20:28:25.826149+00
245	3	logos_1777497951024_xxfkoac20e	2026-04-29 21:25:51.024+00	2026-04-30 05:25:51.024+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-29 21:26:19.985936+00
246	4	logos_1777501762381_jvgu42rupmb	2026-04-29 22:29:22.381+00	2026-04-30 06:29:22.381+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-29 22:29:51.521081+00
247	3	logos_1777503995445_l5rgpbhly9c	2026-04-29 23:06:35.445+00	2026-04-30 07:06:35.445+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-29 23:07:04.780543+00
248	2	logos_1777548543306_q0sy2c7mux	2026-04-30 11:29:03.307+00	2026-04-30 19:29:03.306+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-04-30 11:29:03.554949+00
249	3	logos_1777591885606_eborfeihemn	2026-04-30 23:31:25.607+00	2026-05-01 07:31:25.606+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-04-30 23:31:56.029811+00
250	3	logos_1777666321857_90fjuss6fei	2026-05-01 20:12:01.857+00	2026-05-02 04:12:01.857+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-01 20:12:33.483235+00
251	4	logos_1777667790496_nbd16izpr9	2026-05-01 20:36:30.496+00	2026-05-02 04:36:30.496+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-01 20:37:02.029279+00
252	3	logos_1777668119046_cq1geodhqzk	2026-05-01 20:41:59.046+00	2026-05-02 04:41:59.046+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-01 20:42:30.554662+00
253	3	logos_1777750503053_e5em9cni4t	2026-05-02 19:35:03.053+00	2026-05-03 03:35:03.053+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	f	2026-05-02 19:35:35.198767+00
254	3	logos_1777761960294_g9nt90sy38g	2026-05-02 22:46:00.295+00	2026-05-03 06:46:00.294+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-02 22:46:32.298162+00
255	3	logos_1777832115288_kaavjx2a96p	2026-05-03 18:15:15.288+00	2026-05-04 02:15:15.288+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-03 18:15:48.490447+00
256	2	logos_1777836623528_yor840o64o	2026-05-03 19:30:23.529+00	2026-05-04 03:30:23.528+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-05-03 19:30:23.643616+00
257	3	logos_1777845497198_8z0ta9ufv4q	2026-05-03 21:58:17.198+00	2026-05-04 05:58:17.198+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-03 21:58:50.234856+00
258	4	logos_1777845931300_46gekt66wrl	2026-05-03 22:05:31.309+00	2026-05-04 06:05:31.301+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/147.0.7727.99 Mobile/15E148 Safari/604.1	t	2026-05-03 22:05:31.582166+00
260	2	logos_1777935433225_cr061sh8oa	2026-05-04 22:57:13.226+00	2026-05-05 06:57:13.225+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-05-04 22:57:13.392155+00
259	3	logos_1777914682160_yv0b6r94anp	2026-05-04 17:11:22.161+00	2026-05-05 01:11:22.16+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	f	2026-05-04 17:11:23.129213+00
261	3	logos_1777943375414_tnscgkntoei	2026-05-05 01:09:35.414+00	2026-05-05 09:09:35.414+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-05 01:09:36.025956+00
262	3	logos_1778011479883_2379p1ccwkd	2026-05-05 20:04:39.883+00	2026-05-06 04:04:39.883+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	f	2026-05-05 20:04:39.742627+00
263	3	logos_1778018585481_ljg5ahei3li	2026-05-05 22:03:05.481+00	2026-05-06 06:03:05.481+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-05 22:03:05.204597+00
264	3	logos_1778098617411_rd69wzc2iv	2026-05-06 20:16:57.411+00	2026-05-07 04:16:57.411+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-06 20:16:58.170555+00
265	2	logos_1778101099810_cbtl386q0i	2026-05-06 20:58:19.812+00	2026-05-07 04:58:19.81+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-05-06 20:58:20.207606+00
266	3	logos_1778184400896_dai1dlqnhql	2026-05-07 20:06:40.896+00	2026-05-08 04:06:40.896+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-07 20:06:42.98523+00
267	2	logos_1778243172518_sv9jhjtal3p	2026-05-08 12:26:12.519+00	2026-05-08 20:26:12.518+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-05-08 12:26:12.758307+00
268	3	logos_1778272097979_w28odspo17q	2026-05-08 20:28:17.979+00	2026-05-09 04:28:17.979+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-08 20:28:20.955033+00
269	3	logos_1778357674660_voo1bdilxrs	2026-05-09 20:14:34.66+00	2026-05-10 04:14:34.66+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-09 20:14:38.334554+00
270	4	logos_1778357807310_l0d5lt8ya6i	2026-05-09 20:16:47.31+00	2026-05-10 04:16:47.31+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-09 20:16:50.984629+00
271	3	logos_1778359079056_fkgqklmd9a	2026-05-09 20:37:59.056+00	2026-05-10 04:37:59.056+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-09 20:38:02.699155+00
272	3	logos_1778437597747_10e9a89obwg	2026-05-10 18:26:37.747+00	2026-05-11 02:26:37.747+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-10 18:26:43.08183+00
273	8	logos_1778440895985_t7pei73t2lj	2026-05-10 19:21:35.985+00	2026-05-11 03:21:35.985+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	t	2026-05-10 19:21:37.312808+00
274	3	logos_1778529418622_u7yfgihn4jb	2026-05-11 19:56:58.622+00	2026-05-12 03:56:58.622+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-11 19:56:58.901383+00
275	3	logos_1778613920053_x9osu563hv	2026-05-12 19:25:20.053+00	2026-05-13 03:25:20.053+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-12 19:25:21.620995+00
276	8	logos_1778624469789_s7x7yfh7a0b	2026-05-12 22:21:09.789+00	2026-05-13 06:21:09.789+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	t	2026-05-12 22:21:11.398162+00
277	2	logos_1778678936069_ei3eq7qti6f	2026-05-13 13:28:56.069+00	2026-05-13 21:28:56.069+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0	t	2026-05-13 13:28:54.122396+00
278	3	logos_1778702618078_36dlvcl6dk8	2026-05-13 20:03:38.078+00	2026-05-14 04:03:38.078+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-13 20:03:40.963479+00
279	3	logos_1778704417976_az2y5iug1sc	2026-05-13 20:33:37.976+00	2026-05-14 04:33:37.976+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-13 20:33:40.118938+00
280	4	logos_1778705225376_8ogratwudfj	2026-05-13 20:47:05.376+00	2026-05-14 04:47:05.376+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-13 20:47:08.355478+00
281	8	logos_1778705326026_zq3qkxp8s8d	2026-05-13 20:48:46.026+00	2026-05-14 04:48:46.026+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	t	2026-05-13 20:48:47.772222+00
283	2	logos_1778708129022_68bdln5gmtj	2026-05-13 21:35:29.023+00	2026-05-14 05:35:29.022+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	f	2026-05-13 21:35:29.368977+00
284	2	logos_1778712150158_d7uwxct23yb	2026-05-13 22:42:30.158+00	2026-05-14 06:42:30.158+00	127.0.0.1	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/604.1	t	2026-05-13 22:42:30.261215+00
282	3	logos_1778705411656_btnx4o5xkak	2026-05-13 20:50:11.656+00	2026-05-14 04:50:11.656+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-05-13 20:50:14.632883+00
285	3	logos_1778719758507_mrbnma6lgc8	2026-05-14 00:49:18.507+00	2026-05-14 08:49:18.507+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-05-14 00:49:21.362977+00
286	3	logos_1778720970769_h07w6z2zntg	2026-05-14 01:09:30.769+00	2026-05-14 09:09:30.769+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-14 01:09:33.563945+00
287	3	logos_1778723208806_e9h8ptkkx5e	2026-05-14 01:46:48.806+00	2026-05-14 09:46:48.806+00	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-05-14 01:46:51.642483+00
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre, apellido, email, username, password, rol_id, activo, ultimo_acceso, created_at, telefono, negocio_id) FROM stdin;
4	abel	burgos	abel@gmail.com	abel	$2b$10$g1KaPBNbbw3Q2.y7QrY0hOT81bhPDCqhzZ1IIpeEBsqyqw5lW3bRa	2	t	2026-05-13 20:47:05.594+00	2026-02-24 20:50:25.039229+00		ee860ed4-5d7a-495d-a517-d4a887f9a3f3
8	Admin	Developer	ing.jimrod@gmail.com	AdminDev	$2b$10$A3ASo/fSKmT5S514XbR2Bep7B1nZtFQCUmOBLSECIrXajT/pPhx7C	7	t	2026-05-13 20:48:46.218+00	2026-04-21 20:48:59.383053+00	\N	00000000-0000-0000-0000-000000000000
2	Administrador	Sistema	admin@logospos.com	admin	$2b$10$/K6eEpuezp3OZrE9eFKYfuIk4iQnFa.wjV.TzAExunRXuj69yqpoy	1	t	2026-05-13 22:42:30.352+00	2026-02-24 17:14:26.500811+00	\N	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
3	caja	cajero	caja@gmail.com	caja	$2b$10$klUf53BogLANAOX8A88EzORQbxvrLKMvg1YJqvAdiCROh.DTOsxY6	3	t	2026-05-14 01:46:49.06+00	2026-02-24 20:04:08.511029+00		ee860ed4-5d7a-495d-a517-d4a887f9a3f3
5	Cristofer 	C	cristofer@gmail.com	Cristofer	$2b$10$lKNOXQpgCf.GQSxA0aQo/ugh69B4bcVnUTbrAFuuuiT6.7Ljrubyy	2	t	2026-04-08 16:45:49.294+00	2026-03-02 19:35:02.911239+00		ee860ed4-5d7a-495d-a517-d4a887f9a3f3
\.


--
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (id, numero_venta, cliente_id, usuario_id, caja_id, subtotal, descuento, impuestos, total, metodo_pago, tipo_venta, estado, ncf, tipo_ncf, rnc_cliente, nombre_cliente_fiscal, created_at, mesa_id, pedido_id, updated_at, notas, fecha, negocio_id) FROM stdin;
632	FAC-20260421-3562	\N	3	60	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-21 22:07:34.073559+00	\N	\N	2026-04-21 22:07:34.073559+00	\N	2026-04-21 22:07:34.073559+00	\N
650	FAC-20260423-640	\N	2	62	15	0	0	15	efectivo	\N	completada	\N	\N	\N	\N	2026-04-23 03:26:34.395583+00	\N	\N	2026-04-23 03:26:34.395583+00	\N	2026-04-23 03:26:34.395583+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
664	FAC-20260424-4388	\N	3	67	30	0	0	30	efectivo	\N	completada	\N	\N	\N	\N	2026-04-24 20:45:57.269129+00	\N	\N	2026-04-24 20:45:57.269129+00	\N	2026-04-24 20:45:57.269129+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
678	FAC-20260425-9788	\N	3	68	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 21:34:36.164821+00	\N	\N	2026-04-25 21:34:36.164821+00	\N	2026-04-25 21:34:36.164821+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
692	FAC-20260426-8715	\N	3	69	900	0	0	900	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 22:53:06.684424+00	\N	\N	2026-04-26 22:53:06.684424+00	\N	2026-04-26 22:53:06.684424+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
706	FAC-20260501-3348	\N	3	72	800	0	0	800	efectivo	\N	completada	\N	\N	\N	\N	2026-05-01 00:42:30.034704+00	\N	\N	2026-05-01 00:42:30.034704+00	\N	2026-05-01 00:42:30.034704+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
721	FAC-20260502-7401	\N	3	74	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 04:20:26.89718+00	\N	\N	2026-05-02 04:20:26.89718+00	\N	2026-05-02 04:20:26.89718+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
735	FAC-20260503-1613	\N	3	75	800	0	0	800	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 03:55:12.518358+00	\N	\N	2026-05-03 03:55:12.518358+00	\N	2026-05-03 03:55:12.518358+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
749	FAC-20260505-7062	\N	3	78	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-05 23:45:05.615611+00	\N	\N	2026-05-05 23:45:05.615611+00	\N	2026-05-05 23:45:05.615611+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
765	FAC-20260513-2180	\N	3	82	1900	0	0	1900	efectivo	\N	completada	\N	\N	\N	\N	2026-05-13 01:43:44.578773+00	\N	\N	2026-05-13 01:43:44.578773+00	\N	2026-05-13 01:43:44.578773+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
633	FAC-20260421-0905	\N	3	60	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-21 22:29:51.520274+00	\N	\N	2026-04-21 22:29:51.520274+00	\N	2026-04-21 22:29:51.520274+00	\N
651	FAC-20260423-5408	\N	2	63	15	0	0	15	efectivo	\N	cancelada	\N	\N	\N	\N	2026-04-23 03:34:04.913522+00	\N	\N	2026-04-23 03:34:04.913522+00	\N	2026-04-23 03:34:04.913522+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
665	FAC-20260424-4105	\N	3	67	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-04-24 21:29:30.645938+00	\N	\N	2026-04-24 21:29:30.645938+00	\N	2026-04-24 21:29:30.645938+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
679	FAC-20260425-5751	\N	3	68	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 21:51:04.031709+00	\N	\N	2026-04-25 21:51:04.031709+00	\N	2026-04-25 21:51:04.031709+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
693	FAC-20260426-3540	\N	3	69	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 22:54:16.109589+00	\N	\N	2026-04-26 22:54:16.109589+00	\N	2026-04-26 22:54:16.109589+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
707	FAC-20260501-624	\N	3	72	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-05-01 01:46:55.254334+00	\N	\N	2026-05-01 01:46:55.254334+00	\N	2026-05-01 01:46:55.254334+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
722	FAC-20260502-2640	\N	3	75	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 23:34:24.990521+00	\N	\N	2026-05-02 23:34:24.990521+00	\N	2026-05-02 23:34:24.990521+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
736	FAC-20260503-9668	\N	3	75	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 03:57:25.238622+00	\N	\N	2026-05-03 03:57:25.238622+00	\N	2026-05-03 03:57:25.238622+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
750	FAC-20260506-4777	\N	3	78	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-06 00:15:12.862109+00	\N	\N	2026-05-06 00:15:12.862109+00	\N	2026-05-06 00:15:12.862109+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
751	FAC-20260506-7755	\N	3	78	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-06 00:15:13.52826+00	\N	\N	2026-05-06 00:15:13.52826+00	\N	2026-05-06 00:15:13.52826+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
766	FAC-20260513-6783	\N	3	82	800	0	0	800	efectivo	\N	completada	\N	\N	\N	\N	2026-05-13 03:46:48.405155+00	\N	\N	2026-05-13 03:46:48.405155+00	\N	2026-05-13 03:46:48.405155+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
634	FAC-20260421-6650	\N	3	60	350	0	0	350	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 00:34:37.26914+00	3	236	2026-04-22 00:34:37.26914+00	\N	2026-04-22 00:34:37.26914+00	\N
652	FAC-20260423-3048	\N	3	61	1200	0	0	1200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-23 19:30:07.001546+00	\N	\N	2026-04-23 19:30:07.001546+00	\N	2026-04-23 19:30:07.001546+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
666	FAC-20260425-1055	\N	3	67	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 01:43:51.394539+00	\N	\N	2026-04-25 01:43:51.394539+00	\N	2026-04-25 01:43:51.394539+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
680	FAC-20260425-9845	\N	3	68	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 21:51:04.031709+00	\N	\N	2026-04-25 21:51:04.031709+00	\N	2026-04-25 21:51:04.031709+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
694	FAC-20260426-1714	\N	3	69	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 23:48:22.547601+00	\N	\N	2026-04-26 23:48:22.547601+00	\N	2026-04-26 23:48:22.547601+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
708	FAC-20260501-5432	\N	3	72	800	0	0	800	efectivo	\N	completada	\N	\N	\N	\N	2026-05-01 01:47:16.390038+00	\N	\N	2026-05-01 01:47:16.390038+00	\N	2026-05-01 01:47:16.390038+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
723	FAC-20260502-7989	\N	3	75	30	0	0	30	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 23:35:36.983126+00	\N	\N	2026-05-02 23:35:36.983126+00	\N	2026-05-02 23:35:36.983126+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
737	FAC-20260503-9643	\N	3	75	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 04:00:48.023811+00	\N	\N	2026-05-03 04:00:48.023811+00	\N	2026-05-03 04:00:48.023811+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
752	FAC-20260506-7915	\N	3	79	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-05-06 23:16:52.25071+00	\N	\N	2026-05-06 23:16:52.25071+00	\N	2026-05-06 23:16:52.25071+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
767	FAC-20260514-9565	\N	3	106	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-14 01:49:28.776251+00	\N	\N	2026-05-14 01:49:28.776251+00	\N	2026-05-14 01:49:28.776251+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
635	FAC-20260421-0407	\N	3	60	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 01:14:20.892502+00	\N	\N	2026-04-22 01:14:20.892502+00	\N	2026-04-22 01:14:20.892502+00	\N
653	FAC-20260423-872	\N	3	61	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-04-23 22:55:54.120878+00	\N	\N	2026-04-23 22:55:54.120878+00	\N	2026-04-23 22:55:54.120878+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
667	FAC-20260425-8755	\N	3	67	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 01:45:19.555547+00	\N	\N	2026-04-25 01:45:19.555547+00	\N	2026-04-25 01:45:19.555547+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
681	FAC-20260425-4917	\N	3	68	1215	0	0	1215	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 23:30:27.168178+00	\N	\N	2026-04-25 23:30:27.168178+00	\N	2026-04-25 23:30:27.168178+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
695	FAC-20260426-3433	\N	3	69	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 23:50:11.999317+00	\N	\N	2026-04-26 23:50:11.999317+00	\N	2026-04-26 23:50:11.999317+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
709	FAC-20260501-8600	\N	3	72	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-05-01 01:49:37.183273+00	\N	\N	2026-05-01 01:49:37.183273+00	\N	2026-05-01 01:49:37.183273+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
724	FAC-20260503-6232	\N	3	75	800	0	0	800	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 01:25:32.085967+00	\N	\N	2026-05-03 01:25:32.085967+00	\N	2026-05-03 01:25:32.085967+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
738	FAC-20260503-406	\N	3	76	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 21:56:23.14371+00	\N	\N	2026-05-03 21:56:23.14371+00	\N	2026-05-03 21:56:23.14371+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
753	FAC-20260506-3779	\N	3	79	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-06 23:17:38.895908+00	\N	\N	2026-05-06 23:17:38.895908+00	\N	2026-05-06 23:17:38.895908+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
636	FAC-20260421-2379	\N	3	60	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 01:31:52.961088+00	\N	\N	2026-04-22 01:31:52.961088+00	\N	2026-04-22 01:31:52.961088+00	\N
637	FAC-20260421-4542	\N	3	60	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 01:31:54.864098+00	\N	\N	2026-04-22 01:31:54.864098+00	\N	2026-04-22 01:31:54.864098+00	\N
654	FAC-20260423-8310	\N	3	61	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-23 23:14:40.001026+00	\N	\N	2026-04-23 23:14:40.001026+00	\N	2026-04-23 23:14:40.001026+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
668	FAC-20260425-3615	\N	3	67	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 02:08:49.002707+00	\N	\N	2026-04-25 02:08:49.002707+00	\N	2026-04-25 02:08:49.002707+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
682	FAC-20260426-8819	\N	3	68	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 01:58:58.1863+00	\N	\N	2026-04-26 01:58:58.1863+00	\N	2026-04-26 01:58:58.1863+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
696	FAC-20260426-8720	\N	3	69	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 23:50:56.36247+00	\N	\N	2026-04-26 23:50:56.36247+00	\N	2026-04-26 23:50:56.36247+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
710	FAC-20260501-7506	\N	3	74	525	0	0	525	efectivo	\N	completada	\N	\N	\N	\N	2026-05-01 20:42:55.36769+00	\N	\N	2026-05-01 20:42:55.36769+00	\N	2026-05-01 20:42:55.36769+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
725	FAC-20260503-5212	\N	3	75	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 02:25:19.805731+00	\N	\N	2026-05-03 02:25:19.805731+00	\N	2026-05-03 02:25:19.805731+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
739	FAC-20260503-3157	\N	3	76	475	0	0	475	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 21:58:18.520589+00	\N	\N	2026-05-03 21:58:18.520589+00	\N	2026-05-03 21:58:18.520589+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
754	FAC-20260507-6542	\N	3	79	800	0	0	800	efectivo	\N	completada	\N	\N	\N	\N	2026-05-07 02:34:56.264472+00	\N	\N	2026-05-07 02:34:56.264472+00	\N	2026-05-07 02:34:56.264472+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
638	FAC-20260421-5032	\N	3	60	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 01:43:55.524097+00	\N	\N	2026-04-22 01:43:55.524097+00	\N	2026-04-22 01:43:55.524097+00	\N
655	FAC-20260423-6452	\N	3	61	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-23 23:29:08.69604+00	\N	\N	2026-04-23 23:29:08.69604+00	\N	2026-04-23 23:29:08.69604+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
669	FAC-20260425-2156	\N	3	67	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 02:29:54.087552+00	\N	\N	2026-04-25 02:29:54.087552+00	\N	2026-04-25 02:29:54.087552+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
683	FAC-20260426-871	\N	3	68	2100	0	0	2100	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 02:00:36.125885+00	\N	\N	2026-04-26 02:00:36.125885+00	\N	2026-04-26 02:00:36.125885+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
697	FAC-20260427-9054	\N	3	70	1000	0	0	1000	efectivo	\N	completada	\N	\N	\N	\N	2026-04-27 22:39:21.561642+00	\N	\N	2026-04-27 22:39:21.561642+00	\N	2026-04-27 22:39:21.561642+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
711	FAC-20260501-3390	\N	3	74	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-01 22:11:05.1614+00	\N	\N	2026-05-01 22:11:05.1614+00	\N	2026-05-01 22:11:05.1614+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
726	FAC-20260503-4011	\N	3	75	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 02:26:57.888555+00	\N	\N	2026-05-03 02:26:57.888555+00	\N	2026-05-03 02:26:57.888555+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
740	FAC-20260503-7457	\N	3	76	475	0	0	475	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 21:58:19.871445+00	\N	\N	2026-05-03 21:58:19.871445+00	\N	2026-05-03 21:58:19.871445+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
755	FAC-20260507-9760	\N	3	79	800	0	0	800	efectivo	\N	completada	\N	\N	\N	\N	2026-05-07 02:36:33.308003+00	\N	\N	2026-05-07 02:36:33.308003+00	\N	2026-05-07 02:36:33.308003+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
639	FAC-20260421-8903	\N	3	60	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 01:51:19.399383+00	\N	\N	2026-04-22 01:51:19.399383+00	\N	2026-04-22 01:51:19.399383+00	\N
656	FAC-20260423-4434	\N	3	61	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-23 23:39:38.831127+00	\N	\N	2026-04-23 23:39:38.831127+00	\N	2026-04-23 23:39:38.831127+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
670	FAC-20260425-5166	\N	3	67	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 02:38:07.40808+00	\N	\N	2026-04-25 02:38:07.40808+00	\N	2026-04-25 02:38:07.40808+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
684	FAC-20260426-5695	\N	3	68	300	0	0	300	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 02:17:53.56411+00	\N	\N	2026-04-26 02:17:53.56411+00	\N	2026-04-26 02:17:53.56411+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
698	FAC-20260427-98	\N	3	70	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-27 23:20:15.755349+00	\N	\N	2026-04-27 23:20:15.755349+00	\N	2026-04-27 23:20:15.755349+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
712	FAC-20260501-3252	\N	3	74	950	0	0	950	efectivo	\N	completada	\N	\N	\N	\N	2026-05-01 23:17:37.534845+00	\N	\N	2026-05-01 23:17:37.534845+00	\N	2026-05-01 23:17:37.534845+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
727	FAC-20260503-2953	\N	3	75	1250	0	0	1250	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 02:37:21.852129+00	\N	\N	2026-05-03 02:37:21.852129+00	\N	2026-05-03 02:37:21.852129+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
741	FAC-20260503-1405	\N	3	76	500	0	0	500	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 21:59:28.716945+00	\N	\N	2026-05-03 21:59:28.716945+00	\N	2026-05-03 21:59:28.716945+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
756	FAC-20260507-8511	\N	3	79	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-07 03:41:21.844592+00	\N	\N	2026-05-07 03:41:21.844592+00	\N	2026-05-07 03:41:21.844592+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
640	FAC-20260421-8192	\N	3	60	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 03:14:28.720172+00	\N	\N	2026-04-22 03:14:28.720172+00	\N	2026-04-22 03:14:28.720172+00	\N
641	FAC-20260421-9726	\N	3	60	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 03:14:29.972632+00	\N	\N	2026-04-22 03:14:29.972632+00	\N	2026-04-22 03:14:29.972632+00	\N
657	FAC-20260423-707	\N	3	61	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-23 23:48:51.232939+00	\N	\N	2026-04-23 23:48:51.232939+00	\N	2026-04-23 23:48:51.232939+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
671	FAC-20260425-6876	\N	3	67	2100	0	0	2100	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 02:41:49.770262+00	\N	\N	2026-04-25 02:41:49.770262+00	\N	2026-04-25 02:41:49.770262+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
685	FAC-20260426-7807	\N	3	68	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 02:18:33.922134+00	\N	\N	2026-04-26 02:18:33.922134+00	\N	2026-04-26 02:18:33.922134+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
699	FAC-20260428-5691	\N	3	70	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-28 00:10:43.550464+00	\N	\N	2026-04-28 00:10:43.550464+00	\N	2026-04-28 00:10:43.550464+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
713	FAC-20260502-3212	\N	3	74	950	0	0	950	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 00:51:10.316576+00	\N	\N	2026-05-02 00:51:10.316576+00	\N	2026-05-02 00:51:10.316576+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
728	FAC-20260503-9236	\N	3	75	500	0	0	500	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 03:24:48.593933+00	\N	\N	2026-05-03 03:24:48.593933+00	\N	2026-05-03 03:24:48.593933+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
742	FAC-20260503-7307	\N	3	76	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 22:30:12.909672+00	\N	\N	2026-05-03 22:30:12.909672+00	\N	2026-05-03 22:30:12.909672+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
757	FAC-20260509-2139	\N	3	79	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-05-09 03:29:15.894178+00	\N	\N	2026-05-09 03:29:15.894178+00	\N	2026-05-09 03:29:15.894178+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
642	FAC-20260421-6521	\N	3	60	700	0	0	700	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 03:40:37.032155+00	\N	\N	2026-04-22 03:40:37.032155+00	\N	2026-04-22 03:40:37.032155+00	\N
643	FAC-20260421-8446	\N	3	60	700	0	0	700	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 03:40:38.724119+00	\N	\N	2026-04-22 03:40:38.724119+00	\N	2026-04-22 03:40:38.724119+00	\N
658	FAC-20260424-1903	\N	3	61	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-24 00:25:37.08854+00	\N	\N	2026-04-24 00:25:37.08854+00	\N	2026-04-24 00:25:37.08854+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
672	FAC-20260425-7983	\N	3	67	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 03:14:52.90957+00	\N	\N	2026-04-25 03:14:52.90957+00	\N	2026-04-25 03:14:52.90957+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
686	FAC-20260426-2619	\N	3	68	1625	0	0	1625	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 02:42:33.062431+00	\N	\N	2026-04-26 02:42:33.062431+00	\N	2026-04-26 02:42:33.062431+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
700	FAC-20260428-2615	\N	3	70	450	0	0	450	efectivo	\N	completada	\N	\N	\N	\N	2026-04-28 00:11:20.472409+00	\N	\N	2026-04-28 00:11:20.472409+00	\N	2026-04-28 00:11:20.472409+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
714	FAC-20260502-6211	\N	3	74	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 00:51:53.502813+00	\N	\N	2026-05-02 00:51:53.502813+00	\N	2026-05-02 00:51:53.502813+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
729	FAC-20260503-7294	\N	3	75	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 03:27:23.872305+00	\N	\N	2026-05-03 03:27:23.872305+00	\N	2026-05-03 03:27:23.872305+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
743	FAC-20260504-7152	\N	3	76	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-05-04 00:47:04.807484+00	\N	\N	2026-05-04 00:47:04.807484+00	\N	2026-05-04 00:47:04.807484+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
758	FAC-20260511-2476	\N	3	80	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-05-11 03:48:23.696555+00	\N	\N	2026-05-11 03:48:23.696555+00	\N	2026-05-11 03:48:23.696555+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
644	FAC-20260421-9314	\N	3	60	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-22 03:44:19.556761+00	\N	\N	2026-04-22 03:44:19.556761+00	\N	2026-04-22 03:44:19.556761+00	\N
659	FAC-20260424-1369	\N	3	61	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-24 00:26:59.401666+00	\N	\N	2026-04-24 00:26:59.401666+00	\N	2026-04-24 00:26:59.401666+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
673	FAC-20260425-3221	\N	3	67	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 03:17:44.767386+00	\N	\N	2026-04-25 03:17:44.767386+00	\N	2026-04-25 03:17:44.767386+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
687	FAC-20260426-8615	\N	3	68	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 02:50:31.778402+00	\N	\N	2026-04-26 02:50:31.778402+00	\N	2026-04-26 02:50:31.778402+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
701	FAC-20260428-2676	\N	3	70	15	0	0	15	efectivo	\N	completada	\N	\N	\N	\N	2026-04-28 01:36:59.36241+00	\N	\N	2026-04-28 01:36:59.36241+00	\N	2026-04-28 01:36:59.36241+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
715	FAC-20260502-9932	\N	3	74	900	0	0	900	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 02:15:26.046449+00	\N	\N	2026-05-02 02:15:26.046449+00	\N	2026-05-02 02:15:26.046449+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
730	FAC-20260503-8234	\N	3	75	1000	0	0	1000	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 03:45:43.005334+00	\N	\N	2026-05-03 03:45:43.005334+00	\N	2026-05-03 03:45:43.005334+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
744	FAC-20260504-1622	\N	3	76	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-05-04 02:28:56.256162+00	\N	\N	2026-05-04 02:28:56.256162+00	\N	2026-05-04 02:28:56.256162+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
759	FAC-20260511-9571	\N	3	80	450	0	0	450	efectivo	\N	completada	\N	\N	\N	\N	2026-05-11 03:49:08.40005+00	\N	\N	2026-05-11 03:49:08.40005+00	\N	2026-05-11 03:49:08.40005+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
760	FAC-20260511-6253	\N	3	80	800	0	0	800	efectivo	\N	completada	\N	\N	\N	\N	2026-05-11 03:49:38.121118+00	\N	\N	2026-05-11 03:49:38.121118+00	\N	2026-05-11 03:49:38.121118+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
660	FAC-20260424-1099	\N	3	61	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-24 00:44:03.523147+00	\N	\N	2026-04-24 00:44:03.523147+00	\N	2026-04-24 00:44:03.523147+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
674	FAC-20260425-2267	\N	3	67	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 04:12:58.753723+00	\N	\N	2026-04-25 04:12:58.753723+00	\N	2026-04-25 04:12:58.753723+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
688	FAC-20260426-5357	\N	3	68	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 03:32:44.720436+00	\N	\N	2026-04-26 03:32:44.720436+00	\N	2026-04-26 03:32:44.720436+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
702	FAC-20260429-2409	\N	3	71	1200	0	0	1200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-29 00:08:21.537704+00	\N	\N	2026-04-29 00:08:21.537704+00	\N	2026-04-29 00:08:21.537704+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
716	FAC-20260502-8580	\N	3	74	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 02:32:43.371516+00	\N	\N	2026-05-02 02:32:43.371516+00	\N	2026-05-02 02:32:43.371516+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
731	FAC-20260503-8763	\N	3	75	50	0	0	50	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 03:46:32.839119+00	\N	\N	2026-05-03 03:46:32.839119+00	\N	2026-05-03 03:46:32.839119+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
745	FAC-20260505-6203	\N	3	77	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-05 01:09:14.386849+00	\N	\N	2026-05-05 01:09:14.386849+00	\N	2026-05-05 01:09:14.386849+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
761	FAC-20260512-1751	\N	3	81	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-05-12 03:19:25.107806+00	\N	\N	2026-05-12 03:19:25.107806+00	\N	2026-05-12 03:19:25.107806+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
661	FAC-20260424-2471	\N	2	66	15	0	0	15	efectivo	\N	cancelada	\N	\N	\N	\N	2026-04-24 16:45:50.597829+00	\N	\N	2026-04-24 16:45:50.597829+00	\N	2026-04-24 16:45:50.597829+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
675	FAC-20260425-6686	\N	3	67	3200	0	0	3200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 04:27:11.172949+00	\N	\N	2026-04-25 04:27:11.172949+00	\N	2026-04-25 04:27:11.172949+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
689	FAC-20260426-6002	\N	3	68	300	0	0	300	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 03:33:30.893098+00	\N	\N	2026-04-26 03:33:30.893098+00	\N	2026-04-26 03:33:30.893098+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
703	FAC-20260429-25	\N	3	71	1150	0	0	1150	efectivo	\N	completada	\N	\N	\N	\N	2026-04-29 03:09:53.551157+00	\N	\N	2026-04-29 03:09:53.551157+00	\N	2026-04-29 03:09:53.551157+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
717	FAC-20260502-2616	\N	3	74	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 02:46:17.967159+00	\N	\N	2026-05-02 02:46:17.967159+00	\N	2026-05-02 02:46:17.967159+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
718	FAC-20260502-1665	\N	3	74	900	0	0	900	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 02:47:11.629715+00	\N	\N	2026-05-02 02:47:11.629715+00	\N	2026-05-02 02:47:11.629715+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
732	FAC-20260503-1692	\N	3	75	475	0	0	475	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 03:50:07.846414+00	\N	\N	2026-05-03 03:50:07.846414+00	\N	2026-05-03 03:50:07.846414+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
746	FAC-20260505-6207	\N	3	78	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-05 23:28:15.695602+00	\N	\N	2026-05-05 23:28:15.695602+00	\N	2026-05-05 23:28:15.695602+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
762	FAC-20260512-1560	\N	3	81	1000	0	0	1000	efectivo	\N	completada	\N	\N	\N	\N	2026-05-12 03:20:08.247204+00	\N	\N	2026-05-12 03:20:08.247204+00	\N	2026-05-12 03:20:08.247204+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
662	FAC-20260424-9921	\N	2	66	15	0	0	15	efectivo	\N	cancelada	\N	\N	\N	\N	2026-04-24 16:45:51.450422+00	\N	\N	2026-04-24 16:45:51.450422+00	\N	2026-04-24 16:45:51.450422+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
676	FAC-20260425-22	\N	3	68	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 20:41:44.044505+00	\N	\N	2026-04-25 20:41:44.044505+00	\N	2026-04-25 20:41:44.044505+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
690	FAC-20260426-2880	\N	3	68	575	0	0	575	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 03:35:50.931216+00	\N	\N	2026-04-26 03:35:50.931216+00	\N	2026-04-26 03:35:50.931216+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
704	FAC-20260501-7746	\N	3	72	800	0	0	800	efectivo	\N	completada	\N	\N	\N	\N	2026-05-01 00:22:34.244087+00	\N	\N	2026-05-01 00:22:34.244087+00	\N	2026-05-01 00:22:34.244087+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
719	FAC-20260502-8640	\N	3	74	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 02:57:01.732603+00	\N	\N	2026-05-02 02:57:01.732603+00	\N	2026-05-02 02:57:01.732603+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
733	FAC-20260503-3736	\N	3	75	150	0	0	150	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 03:50:46.040903+00	\N	\N	2026-05-03 03:50:46.040903+00	\N	2026-05-03 03:50:46.040903+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
747	FAC-20260505-4333	\N	3	78	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-05 23:28:52.430884+00	\N	\N	2026-05-05 23:28:52.430884+00	\N	2026-05-05 23:28:52.430884+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
763	FAC-20260513-8627	\N	3	82	1050	0	0	1050	efectivo	\N	completada	\N	\N	\N	\N	2026-05-13 01:05:23.232779+00	\N	\N	2026-05-13 01:05:23.232779+00	\N	2026-05-13 01:05:23.232779+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
1	FAC-20260224-2873	\N	2	1	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-02-24 18:50:48.235683+00	\N	\N	2026-02-24 18:50:48.235683+00	\N	2026-02-24 18:50:48.235683+00	11111111-1111-1111-1111-111111111111
2	FAC-20260224-3182	\N	3	2	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-02-24 20:06:03.058007+00	1	1	2026-02-24 20:06:03.058007+00	\N	2026-02-24 20:06:03.058007+00	11111111-1111-1111-1111-111111111111
3	FAC-20260224-5694	\N	4	3	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-02-24 20:57:30.594352+00	\N	\N	2026-02-24 20:57:30.594352+00	\N	2026-02-24 20:57:30.594352+00	11111111-1111-1111-1111-111111111111
4	FAC-20260224-8312	\N	4	3	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-02-24 20:59:53.171284+00	1	2	2026-02-24 20:59:53.171284+00	\N	2026-02-24 20:59:53.171284+00	11111111-1111-1111-1111-111111111111
5	FAC-20260225-7821	2	2	7	200	0	0	200	credito	credito	completada	\N	\N	\N	Elier arismendy	2026-02-25 18:20:38.014578+00	\N	\N	2026-02-25 18:20:38.014578+00	\N	2026-02-25 18:20:38.014578+00	11111111-1111-1111-1111-111111111111
6	FAC-20260225-8895	2	2	7	200	0	0	200	credito	credito	completada	\N	\N	\N	Elier arismendy	2026-02-25 18:20:39.002598+00	\N	\N	2026-02-25 18:20:39.002598+00	\N	2026-02-25 18:20:39.002598+00	11111111-1111-1111-1111-111111111111
7	FAC-20260225-3161	2	2	7	200	0	0	200	credito	credito	completada	\N	\N	\N	Elier arismendy	2026-02-25 19:55:52.09731+00	\N	\N	2026-02-25 19:55:52.09731+00	\N	2026-02-25 19:55:52.09731+00	11111111-1111-1111-1111-111111111111
8	FAC-20260225-5852	2	2	7	200	0	0	200	credito	credito	completada	\N	\N	\N	Elier arismendy	2026-02-25 20:41:15.099031+00	\N	\N	2026-02-25 20:41:15.099031+00	\N	2026-02-25 20:41:15.099031+00	11111111-1111-1111-1111-111111111111
9	FAC-20260225-2549	2	2	7	200	0	0	200	credito	credito	completada	\N	\N	\N	Elier arismendy	2026-02-25 20:59:21.837085+00	\N	\N	2026-02-25 20:59:21.837085+00	\N	2026-02-25 20:59:21.837085+00	11111111-1111-1111-1111-111111111111
10	FAC-20260225-8153	2	2	7	400	0	0	400	credito	credito	completada	\N	\N	\N	Elier arismendy	2026-02-25 21:01:07.384356+00	\N	\N	2026-02-25 21:01:07.384356+00	\N	2026-02-25 21:01:07.384356+00	11111111-1111-1111-1111-111111111111
11	FAC-20260225-4611	2	4	8	200	0	0	200	credito	credito	completada	\N	\N	\N	Elier arismendy	2026-02-25 22:10:39.551976+00	\N	\N	2026-02-25 22:10:39.551976+00	\N	2026-02-25 22:10:39.551976+00	11111111-1111-1111-1111-111111111111
12	FAC-20260225-8999	2	2	7	200	0	0	200	credito	credito	completada	\N	\N	\N	Elier arismendy	2026-02-25 22:14:13.949959+00	\N	\N	2026-02-25 22:14:13.949959+00	\N	2026-02-25 22:14:13.949959+00	11111111-1111-1111-1111-111111111111
13	FAC-20260327-5771	\N	3	27	175	0	0	175	efectivo	contado	cancelada	\N	\N	\N	\N	2026-03-27 14:28:40.698474+00	\N	\N	2026-03-27 14:28:40.698474+00	\N	2026-03-27 14:28:40.698474+00	11111111-1111-1111-1111-111111111111
14	FAC-20260328-8353	\N	3	36	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-03-28 21:40:08.43592+00	3	12	2026-03-28 21:40:08.43592+00	\N	2026-03-28 21:40:08.43592+00	11111111-1111-1111-1111-111111111111
15	FAC-20260328-7419	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-28 22:24:57.4744+00	4	14	2026-03-28 22:24:57.4744+00	\N	2026-03-28 22:24:57.4744+00	11111111-1111-1111-1111-111111111111
16	FAC-20260328-5016	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-28 23:29:55.019395+00	\N	\N	2026-03-28 23:29:55.019395+00	\N	2026-03-28 23:29:55.019395+00	11111111-1111-1111-1111-111111111111
17	FAC-20260328-8169	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-28 23:31:28.143732+00	\N	\N	2026-03-28 23:31:28.143732+00	\N	2026-03-28 23:31:28.143732+00	11111111-1111-1111-1111-111111111111
18	FAC-20260328-2862	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-28 23:40:43.078302+00	\N	\N	2026-03-28 23:40:43.078302+00	\N	2026-03-28 23:40:43.078302+00	11111111-1111-1111-1111-111111111111
19	FAC-20260328-5578	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-28 23:52:35.61745+00	\N	\N	2026-03-28 23:52:35.61745+00	\N	2026-03-28 23:52:35.61745+00	11111111-1111-1111-1111-111111111111
20	FAC-20260328-4524	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-28 23:56:54.475973+00	\N	\N	2026-03-28 23:56:54.475973+00	\N	2026-03-28 23:56:54.475973+00	11111111-1111-1111-1111-111111111111
21	FAC-20260328-7645	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 00:14:47.69569+00	3	15	2026-03-29 00:14:47.69569+00	\N	2026-03-29 00:14:47.69569+00	11111111-1111-1111-1111-111111111111
22	FAC-20260328-6121	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 00:23:26.065843+00	3	16	2026-03-29 00:23:26.065843+00	\N	2026-03-29 00:23:26.065843+00	11111111-1111-1111-1111-111111111111
23	FAC-20260328-6900	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 00:37:06.868986+00	3	17	2026-03-29 00:37:06.868986+00	\N	2026-03-29 00:37:06.868986+00	11111111-1111-1111-1111-111111111111
24	FAC-20260328-3943	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 00:41:03.881056+00	3	18	2026-03-29 00:41:03.881056+00	\N	2026-03-29 00:41:03.881056+00	11111111-1111-1111-1111-111111111111
25	FAC-20260328-6578	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 00:44:26.529078+00	3	19	2026-03-29 00:44:26.529078+00	\N	2026-03-29 00:44:26.529078+00	11111111-1111-1111-1111-111111111111
26	FAC-20260328-3063	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 00:51:43.010105+00	3	20	2026-03-29 00:51:43.010105+00	\N	2026-03-29 00:51:43.010105+00	11111111-1111-1111-1111-111111111111
27	FAC-20260328-3937	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 00:54:44.059913+00	\N	\N	2026-03-29 00:54:44.059913+00	\N	2026-03-29 00:54:44.059913+00	11111111-1111-1111-1111-111111111111
28	FAC-20260328-5201	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:05:35.093664+00	3	21	2026-03-29 01:05:35.093664+00	\N	2026-03-29 01:05:35.093664+00	11111111-1111-1111-1111-111111111111
29	FAC-20260328-7454	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:07:57.372164+00	\N	\N	2026-03-29 01:07:57.372164+00	\N	2026-03-29 01:07:57.372164+00	11111111-1111-1111-1111-111111111111
30	FAC-20260328-8545	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:11:38.447281+00	\N	\N	2026-03-29 01:11:38.447281+00	\N	2026-03-29 01:11:38.447281+00	11111111-1111-1111-1111-111111111111
31	FAC-20260328-4013	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:19:13.985939+00	\N	\N	2026-03-29 01:19:13.985939+00	\N	2026-03-29 01:19:13.985939+00	11111111-1111-1111-1111-111111111111
32	FAC-20260328-6687	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:23:16.583881+00	\N	\N	2026-03-29 01:23:16.583881+00	\N	2026-03-29 01:23:16.583881+00	11111111-1111-1111-1111-111111111111
33	FAC-20260328-6107	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:23:46.103373+00	\N	\N	2026-03-29 01:23:46.103373+00	\N	2026-03-29 01:23:46.103373+00	11111111-1111-1111-1111-111111111111
34	FAC-20260328-8294	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:36:38.193242+00	\N	\N	2026-03-29 01:36:38.193242+00	\N	2026-03-29 01:36:38.193242+00	11111111-1111-1111-1111-111111111111
35	FAC-20260328-1331	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:41:31.221776+00	4	23	2026-03-29 01:41:31.221776+00	\N	2026-03-29 01:41:31.221776+00	11111111-1111-1111-1111-111111111111
36	FAC-20260328-8038	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:43:07.919199+00	\N	\N	2026-03-29 01:43:07.919199+00	\N	2026-03-29 01:43:07.919199+00	11111111-1111-1111-1111-111111111111
37	FAC-20260328-2030	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:55:01.915004+00	4	24	2026-03-29 01:55:01.915004+00	\N	2026-03-29 01:55:01.915004+00	11111111-1111-1111-1111-111111111111
38	FAC-20260328-0213	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 01:56:20.085053+00	\N	\N	2026-03-29 01:56:20.085053+00	\N	2026-03-29 01:56:20.085053+00	11111111-1111-1111-1111-111111111111
39	FAC-20260328-5659	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:03:05.675803+00	\N	\N	2026-03-29 02:03:05.675803+00	\N	2026-03-29 02:03:05.675803+00	11111111-1111-1111-1111-111111111111
40	FAC-20260328-1814	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:04:01.72098+00	\N	\N	2026-03-29 02:04:01.72098+00	\N	2026-03-29 02:04:01.72098+00	11111111-1111-1111-1111-111111111111
41	FAC-20260328-9763	\N	3	36	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:04:29.630757+00	\N	\N	2026-03-29 02:04:29.630757+00	\N	2026-03-29 02:04:29.630757+00	11111111-1111-1111-1111-111111111111
42	FAC-20260328-2553	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:15:02.420302+00	\N	\N	2026-03-29 02:15:02.420302+00	\N	2026-03-29 02:15:02.420302+00	11111111-1111-1111-1111-111111111111
43	FAC-20260328-4129	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:19:13.966572+00	5	26	2026-03-29 02:19:13.966572+00	\N	2026-03-29 02:19:13.966572+00	11111111-1111-1111-1111-111111111111
44	FAC-20260328-3580	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:23:33.426856+00	\N	\N	2026-03-29 02:23:33.426856+00	\N	2026-03-29 02:23:33.426856+00	11111111-1111-1111-1111-111111111111
45	FAC-20260328-7440	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:24:37.507875+00	\N	\N	2026-03-29 02:24:37.507875+00	\N	2026-03-29 02:24:37.507875+00	11111111-1111-1111-1111-111111111111
46	FAC-20260328-3812	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:29:23.660792+00	\N	\N	2026-03-29 02:29:23.660792+00	\N	2026-03-29 02:29:23.660792+00	11111111-1111-1111-1111-111111111111
47	FAC-20260328-5234	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:29:25.060026+00	\N	\N	2026-03-29 02:29:25.060026+00	\N	2026-03-29 02:29:25.060026+00	11111111-1111-1111-1111-111111111111
48	FAC-20260328-2742	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:34:22.790202+00	\N	\N	2026-03-29 02:34:22.790202+00	\N	2026-03-29 02:34:22.790202+00	11111111-1111-1111-1111-111111111111
49	FAC-20260328-1201	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:36:01.133304+00	\N	\N	2026-03-29 02:36:01.133304+00	\N	2026-03-29 02:36:01.133304+00	11111111-1111-1111-1111-111111111111
50	FAC-20260328-1219	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:44:51.08538+00	3	22	2026-03-29 02:44:51.08538+00	\N	2026-03-29 02:44:51.08538+00	11111111-1111-1111-1111-111111111111
51	FAC-20260328-0429	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:45:20.244428+00	\N	\N	2026-03-29 02:45:20.244428+00	\N	2026-03-29 02:45:20.244428+00	11111111-1111-1111-1111-111111111111
52	FAC-20260328-7836	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:45:37.64687+00	\N	\N	2026-03-29 02:45:37.64687+00	\N	2026-03-29 02:45:37.64687+00	11111111-1111-1111-1111-111111111111
53	FAC-20260328-7877	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:52:27.868544+00	\N	\N	2026-03-29 02:52:27.868544+00	\N	2026-03-29 02:52:27.868544+00	11111111-1111-1111-1111-111111111111
54	FAC-20260328-9369	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 02:57:19.180782+00	\N	\N	2026-03-29 02:57:19.180782+00	\N	2026-03-29 02:57:19.180782+00	11111111-1111-1111-1111-111111111111
55	FAC-20260328-9459	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:02:59.268173+00	\N	\N	2026-03-29 03:02:59.268173+00	\N	2026-03-29 03:02:59.268173+00	11111111-1111-1111-1111-111111111111
56	FAC-20260328-0775	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:03:00.570061+00	\N	\N	2026-03-29 03:03:00.570061+00	\N	2026-03-29 03:03:00.570061+00	11111111-1111-1111-1111-111111111111
57	FAC-20260328-8030	\N	3	36	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:03:37.826015+00	5	28	2026-03-29 03:03:37.826015+00	\N	2026-03-29 03:03:37.826015+00	11111111-1111-1111-1111-111111111111
58	FAC-20260328-3962	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:07:43.816324+00	\N	\N	2026-03-29 03:07:43.816324+00	\N	2026-03-29 03:07:43.816324+00	11111111-1111-1111-1111-111111111111
59	FAC-20260328-3086	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:08:12.87929+00	\N	\N	2026-03-29 03:08:12.87929+00	\N	2026-03-29 03:08:12.87929+00	11111111-1111-1111-1111-111111111111
60	FAC-20260328-5964	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:20:35.782463+00	\N	\N	2026-03-29 03:20:35.782463+00	\N	2026-03-29 03:20:35.782463+00	11111111-1111-1111-1111-111111111111
61	FAC-20260328-5870	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:25:55.717363+00	\N	\N	2026-03-29 03:25:55.717363+00	\N	2026-03-29 03:25:55.717363+00	11111111-1111-1111-1111-111111111111
62	FAC-20260328-8450	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:27:28.232251+00	5	29	2026-03-29 03:27:28.232251+00	\N	2026-03-29 03:27:28.232251+00	11111111-1111-1111-1111-111111111111
63	FAC-20260328-3278	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:29:53.066585+00	\N	\N	2026-03-29 03:29:53.066585+00	\N	2026-03-29 03:29:53.066585+00	11111111-1111-1111-1111-111111111111
64	FAC-20260328-6389	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:31:16.405393+00	\N	\N	2026-03-29 03:31:16.405393+00	\N	2026-03-29 03:31:16.405393+00	11111111-1111-1111-1111-111111111111
65	FAC-20260328-6629	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:32:16.450026+00	\N	\N	2026-03-29 03:32:16.450026+00	\N	2026-03-29 03:32:16.450026+00	11111111-1111-1111-1111-111111111111
66	FAC-20260328-9061	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:40:58.840953+00	3	27	2026-03-29 03:40:58.840953+00	\N	2026-03-29 03:40:58.840953+00	11111111-1111-1111-1111-111111111111
67	FAC-20260328-8400	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:41:58.180646+00	\N	\N	2026-03-29 03:41:58.180646+00	\N	2026-03-29 03:41:58.180646+00	11111111-1111-1111-1111-111111111111
68	FAC-20260328-8747	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 03:55:48.589817+00	\N	\N	2026-03-29 03:55:48.589817+00	\N	2026-03-29 03:55:48.589817+00	11111111-1111-1111-1111-111111111111
69	FAC-20260328-6093	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 04:03:45.951475+00	\N	\N	2026-03-29 04:03:45.951475+00	\N	2026-03-29 04:03:45.951475+00	11111111-1111-1111-1111-111111111111
70	FAC-20260328-5816	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 04:11:25.613057+00	\N	\N	2026-03-29 04:11:25.613057+00	\N	2026-03-29 04:11:25.613057+00	11111111-1111-1111-1111-111111111111
71	FAC-20260328-5962	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 04:12:25.733353+00	\N	\N	2026-03-29 04:12:25.733353+00	\N	2026-03-29 04:12:25.733353+00	11111111-1111-1111-1111-111111111111
72	FAC-20260328-8699	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 04:23:58.449816+00	\N	\N	2026-03-29 04:23:58.449816+00	\N	2026-03-29 04:23:58.449816+00	11111111-1111-1111-1111-111111111111
73	FAC-20260328-3999	\N	3	36	700	0	0	700	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 04:25:53.747859+00	4	25	2026-03-29 04:25:53.747859+00	\N	2026-03-29 04:25:53.747859+00	11111111-1111-1111-1111-111111111111
74	FAC-20260328-1410	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 04:31:11.423411+00	\N	\N	2026-03-29 04:31:11.423411+00	\N	2026-03-29 04:31:11.423411+00	11111111-1111-1111-1111-111111111111
75	FAC-20260328-4479	\N	3	36	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 04:35:14.242624+00	5	30	2026-03-29 04:35:14.242624+00	\N	2026-03-29 04:35:14.242624+00	11111111-1111-1111-1111-111111111111
76	FAC-20260328-6011	\N	3	36	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 04:45:35.825436+00	\N	\N	2026-03-29 04:45:35.825436+00	\N	2026-03-29 04:45:35.825436+00	11111111-1111-1111-1111-111111111111
77	FAC-20260328-2293	\N	3	36	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 04:56:12.068246+00	3	31	2026-03-29 04:56:12.068246+00	\N	2026-03-29 04:56:12.068246+00	11111111-1111-1111-1111-111111111111
78	FAC-20260328-4637	\N	3	36	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 05:00:14.365392+00	\N	\N	2026-03-29 05:00:14.365392+00	\N	2026-03-29 05:00:14.365392+00	11111111-1111-1111-1111-111111111111
79	FAC-20260329-0986	\N	3	37	1000	0	0	1000	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 20:40:12.149702+00	3	32	2026-03-29 20:40:12.149702+00	\N	2026-03-29 20:40:12.149702+00	11111111-1111-1111-1111-111111111111
80	FAC-20260329-7317	\N	3	37	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 21:33:08.402625+00	3	35	2026-03-29 21:33:08.402625+00	\N	2026-03-29 21:33:08.402625+00	11111111-1111-1111-1111-111111111111
81	FAC-20260329-9637	\N	3	37	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 21:39:10.743851+00	5	34	2026-03-29 21:39:10.743851+00	\N	2026-03-29 21:39:10.743851+00	11111111-1111-1111-1111-111111111111
82	FAC-20260329-7851	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 21:45:29.062271+00	\N	\N	2026-03-29 21:45:29.062271+00	\N	2026-03-29 21:45:29.062271+00	11111111-1111-1111-1111-111111111111
83	FAC-20260329-8216	\N	3	37	1400	0	0	1400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 21:49:19.301883+00	4	33	2026-03-29 21:49:19.301883+00	\N	2026-03-29 21:49:19.301883+00	11111111-1111-1111-1111-111111111111
84	FAC-20260329-0801	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 22:01:11.87979+00	\N	\N	2026-03-29 22:01:11.87979+00	\N	2026-03-29 22:01:11.87979+00	11111111-1111-1111-1111-111111111111
85	FAC-20260329-2046	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 22:01:13.101416+00	\N	\N	2026-03-29 22:01:13.101416+00	\N	2026-03-29 22:01:13.101416+00	11111111-1111-1111-1111-111111111111
86	FAC-20260329-8333	\N	3	37	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 22:43:59.392364+00	3	36	2026-03-29 22:43:59.392364+00	\N	2026-03-29 22:43:59.392364+00	11111111-1111-1111-1111-111111111111
87	FAC-20260329-7102	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 22:44:28.137069+00	5	38	2026-03-29 22:44:28.137069+00	\N	2026-03-29 22:44:28.137069+00	11111111-1111-1111-1111-111111111111
88	FAC-20260329-3483	\N	3	37	1000	0	0	1000	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 23:38:14.480355+00	4	37	2026-03-29 23:38:14.480355+00	\N	2026-03-29 23:38:14.480355+00	11111111-1111-1111-1111-111111111111
89	FAC-20260329-7602	\N	3	37	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 23:40:48.59506+00	4	40	2026-03-29 23:40:48.59506+00	\N	2026-03-29 23:40:48.59506+00	11111111-1111-1111-1111-111111111111
90	FAC-20260329-3145	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 23:48:34.184504+00	\N	\N	2026-03-29 23:48:34.184504+00	\N	2026-03-29 23:48:34.184504+00	11111111-1111-1111-1111-111111111111
91	FAC-20260329-2659	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 23:49:33.670008+00	\N	\N	2026-03-29 23:49:33.670008+00	\N	2026-03-29 23:49:33.670008+00	11111111-1111-1111-1111-111111111111
92	FAC-20260329-1328	\N	3	37	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-29 23:52:42.319368+00	\N	\N	2026-03-29 23:52:42.319368+00	\N	2026-03-29 23:52:42.319368+00	11111111-1111-1111-1111-111111111111
93	FAC-20260329-3682	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 00:38:04.641531+00	\N	\N	2026-03-30 00:38:04.641531+00	\N	2026-03-30 00:38:04.641531+00	11111111-1111-1111-1111-111111111111
94	FAC-20260329-8825	\N	3	37	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 00:44:09.819571+00	\N	\N	2026-03-30 00:44:09.819571+00	\N	2026-03-30 00:44:09.819571+00	11111111-1111-1111-1111-111111111111
95	FAC-20260329-9965	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 01:16:51.123935+00	\N	\N	2026-03-30 01:16:51.123935+00	\N	2026-03-30 01:16:51.123935+00	11111111-1111-1111-1111-111111111111
96	FAC-20260329-6510	\N	3	37	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 01:23:07.394331+00	13	43	2026-03-30 01:23:07.394331+00	\N	2026-03-30 01:23:07.394331+00	11111111-1111-1111-1111-111111111111
97	FAC-20260329-7940	\N	3	37	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 01:27:38.840873+00	3	39	2026-03-30 01:27:38.840873+00	\N	2026-03-30 01:27:38.840873+00	11111111-1111-1111-1111-111111111111
98	FAC-20260329-8165	\N	3	37	1050	0	0	1050	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 01:30:09.037249+00	12	44	2026-03-30 01:30:09.037249+00	\N	2026-03-30 01:30:09.037249+00	11111111-1111-1111-1111-111111111111
99	FAC-20260329-6488	\N	3	37	1050	0	0	1050	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 01:32:27.36524+00	\N	\N	2026-03-30 01:32:27.36524+00	\N	2026-03-30 01:32:27.36524+00	11111111-1111-1111-1111-111111111111
100	FAC-20260329-3036	\N	3	37	1600	0	0	1600	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 01:42:33.904998+00	4	41	2026-03-30 01:42:33.904998+00	\N	2026-03-30 01:42:33.904998+00	11111111-1111-1111-1111-111111111111
101	FAC-20260329-9197	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 01:58:10.350743+00	\N	\N	2026-03-30 01:58:10.350743+00	\N	2026-03-30 01:58:10.350743+00	11111111-1111-1111-1111-111111111111
102	FAC-20260329-7847	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 02:03:48.706306+00	4	46	2026-03-30 02:03:48.706306+00	\N	2026-03-30 02:03:48.706306+00	11111111-1111-1111-1111-111111111111
103	FAC-20260329-7270	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 02:06:48.130221+00	\N	\N	2026-03-30 02:06:48.130221+00	\N	2026-03-30 02:06:48.130221+00	11111111-1111-1111-1111-111111111111
104	FAC-20260329-3623	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 02:15:14.722156+00	\N	\N	2026-03-30 02:15:14.722156+00	\N	2026-03-30 02:15:14.722156+00	11111111-1111-1111-1111-111111111111
105	FAC-20260329-8748	\N	3	37	450	0	0	450	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 02:17:49.600898+00	5	47	2026-03-30 02:17:49.600898+00	\N	2026-03-30 02:17:49.600898+00	11111111-1111-1111-1111-111111111111
106	FAC-20260329-6842	\N	3	37	650	0	0	650	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 02:20:17.691648+00	\N	\N	2026-03-30 02:20:17.691648+00	\N	2026-03-30 02:20:17.691648+00	11111111-1111-1111-1111-111111111111
107	FAC-20260329-9981	\N	3	37	125	0	0	125	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 02:29:41.135814+00	\N	\N	2026-03-30 02:29:41.135814+00	\N	2026-03-30 02:29:41.135814+00	11111111-1111-1111-1111-111111111111
108	FAC-20260329-5656	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 02:35:16.625207+00	\N	\N	2026-03-30 02:35:16.625207+00	\N	2026-03-30 02:35:16.625207+00	11111111-1111-1111-1111-111111111111
109	FAC-20260329-9478	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 02:35:30.308726+00	\N	\N	2026-03-30 02:35:30.308726+00	\N	2026-03-30 02:35:30.308726+00	11111111-1111-1111-1111-111111111111
110	FAC-20260329-6174	\N	3	37	750	0	0	750	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 02:58:37.012612+00	4	48	2026-03-30 02:58:37.012612+00	\N	2026-03-30 02:58:37.012612+00	11111111-1111-1111-1111-111111111111
111	FAC-20260329-8917	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 02:59:49.731598+00	\N	\N	2026-03-30 02:59:49.731598+00	\N	2026-03-30 02:59:49.731598+00	11111111-1111-1111-1111-111111111111
112	FAC-20260329-1118	\N	3	37	350	0	0	350	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 03:20:11.902104+00	4	50	2026-03-30 03:20:11.902104+00	\N	2026-03-30 03:20:11.902104+00	11111111-1111-1111-1111-111111111111
113	FAC-20260329-4305	\N	3	37	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 03:39:25.068956+00	5	49	2026-03-30 03:39:25.068956+00	\N	2026-03-30 03:39:25.068956+00	11111111-1111-1111-1111-111111111111
114	FAC-20260329-4960	\N	3	37	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 04:01:15.763325+00	\N	\N	2026-03-30 04:01:15.763325+00	\N	2026-03-30 04:01:15.763325+00	11111111-1111-1111-1111-111111111111
115	FAC-20260329-3850	\N	3	37	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 04:15:04.616077+00	5	52	2026-03-30 04:15:04.616077+00	\N	2026-03-30 04:15:04.616077+00	11111111-1111-1111-1111-111111111111
116	FAC-20260329-3664	\N	3	37	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 04:16:24.395155+00	4	51	2026-03-30 04:16:24.395155+00	\N	2026-03-30 04:16:24.395155+00	11111111-1111-1111-1111-111111111111
117	FAC-20260329-4207	\N	3	37	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 04:17:34.954646+00	3	45	2026-03-30 04:17:34.954646+00	\N	2026-03-30 04:17:34.954646+00	11111111-1111-1111-1111-111111111111
118	FAC-20260330-9219	\N	3	38	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 21:48:21.65675+00	\N	\N	2026-03-30 21:48:21.65675+00	\N	2026-03-30 21:48:21.65675+00	11111111-1111-1111-1111-111111111111
119	FAC-20260330-3478	\N	3	38	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 21:57:15.877371+00	\N	\N	2026-03-30 21:57:15.877371+00	\N	2026-03-30 21:57:15.877371+00	11111111-1111-1111-1111-111111111111
120	FAC-20260330-0171	\N	3	38	550	0	0	550	efectivo	contado	completada	\N	\N	\N	\N	2026-03-30 22:19:32.405481+00	3	54	2026-03-30 22:19:32.405481+00	\N	2026-03-30 22:19:32.405481+00	11111111-1111-1111-1111-111111111111
121	FAC-20260330-6492	\N	3	38	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 00:25:48.646552+00	4	56	2026-03-31 00:25:48.646552+00	\N	2026-03-31 00:25:48.646552+00	11111111-1111-1111-1111-111111111111
122	FAC-20260330-9854	\N	3	38	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 01:26:42.005969+00	3	55	2026-03-31 01:26:42.005969+00	\N	2026-03-31 01:26:42.005969+00	11111111-1111-1111-1111-111111111111
123	FAC-20260330-3471	\N	3	38	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 01:38:05.589247+00	\N	\N	2026-03-31 01:38:05.589247+00	\N	2026-03-31 01:38:05.589247+00	11111111-1111-1111-1111-111111111111
124	FAC-20260330-3226	\N	3	38	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 01:58:15.292536+00	3	59	2026-03-31 01:58:15.292536+00	\N	2026-03-31 01:58:15.292536+00	11111111-1111-1111-1111-111111111111
125	FAC-20260330-8053	\N	3	38	1200	0	0	1200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 02:49:00.138113+00	5	57	2026-03-31 02:49:00.138113+00	\N	2026-03-31 02:49:00.138113+00	11111111-1111-1111-1111-111111111111
126	FAC-20260330-2359	\N	3	38	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 02:50:24.398717+00	13	58	2026-03-31 02:50:24.398717+00	\N	2026-03-31 02:50:24.398717+00	11111111-1111-1111-1111-111111111111
127	FAC-20260331-8195	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 22:06:21.015087+00	3	60	2026-03-31 22:06:21.015087+00	\N	2026-03-31 22:06:21.015087+00	11111111-1111-1111-1111-111111111111
128	FAC-20260331-9658	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 22:06:32.470619+00	3	60	2026-03-31 22:06:32.470619+00	\N	2026-03-31 22:06:32.470619+00	11111111-1111-1111-1111-111111111111
129	FAC-20260331-4847	\N	3	39	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 22:06:47.625986+00	\N	\N	2026-03-31 22:06:47.625986+00	\N	2026-03-31 22:06:47.625986+00	11111111-1111-1111-1111-111111111111
130	FAC-20260331-7695	\N	3	39	750	0	0	750	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 22:35:10.490079+00	4	61	2026-03-31 22:35:10.490079+00	\N	2026-03-31 22:35:10.490079+00	11111111-1111-1111-1111-111111111111
131	FAC-20260331-8176	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 22:42:40.938698+00	4	64	2026-03-31 22:42:40.938698+00	\N	2026-03-31 22:42:40.938698+00	11111111-1111-1111-1111-111111111111
132	FAC-20260331-7993	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 23:05:01.155519+00	\N	\N	2026-03-31 23:05:01.155519+00	\N	2026-03-31 23:05:01.155519+00	11111111-1111-1111-1111-111111111111
133	FAC-20260331-2428	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 23:26:05.454813+00	\N	\N	2026-03-31 23:26:05.454813+00	\N	2026-03-31 23:26:05.454813+00	11111111-1111-1111-1111-111111111111
134	FAC-20260331-6375	\N	3	39	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 23:26:49.101154+00	5	63	2026-03-31 23:26:49.101154+00	\N	2026-03-31 23:26:49.101154+00	11111111-1111-1111-1111-111111111111
135	FAC-20260331-5717	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-03-31 23:56:48.641863+00	\N	\N	2026-03-31 23:56:48.641863+00	\N	2026-03-31 23:56:48.641863+00	11111111-1111-1111-1111-111111111111
136	FAC-20260331-9765	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 00:36:02.470594+00	\N	\N	2026-04-01 00:36:02.470594+00	\N	2026-04-01 00:36:02.470594+00	11111111-1111-1111-1111-111111111111
137	FAC-20260331-4254	\N	3	39	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 00:48:46.94742+00	4	65	2026-04-01 00:48:46.94742+00	\N	2026-04-01 00:48:46.94742+00	11111111-1111-1111-1111-111111111111
138	FAC-20260331-6675	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 01:03:39.495223+00	\N	\N	2026-04-01 01:03:39.495223+00	\N	2026-04-01 01:03:39.495223+00	11111111-1111-1111-1111-111111111111
139	FAC-20260331-5047	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 01:25:17.967195+00	\N	\N	2026-04-01 01:25:17.967195+00	\N	2026-04-01 01:25:17.967195+00	11111111-1111-1111-1111-111111111111
140	FAC-20260331-2528	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 01:48:25.198735+00	\N	\N	2026-04-01 01:48:25.198735+00	\N	2026-04-01 01:48:25.198735+00	11111111-1111-1111-1111-111111111111
141	FAC-20260331-2394	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 02:00:14.998302+00	\N	\N	2026-04-01 02:00:14.998302+00	\N	2026-04-01 02:00:14.998302+00	11111111-1111-1111-1111-111111111111
142	FAC-20260331-8266	\N	3	39	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 02:02:10.892229+00	\N	\N	2026-04-01 02:02:10.892229+00	\N	2026-04-01 02:02:10.892229+00	11111111-1111-1111-1111-111111111111
143	FAC-20260331-0405	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 02:12:23.012226+00	\N	\N	2026-04-01 02:12:23.012226+00	\N	2026-04-01 02:12:23.012226+00	11111111-1111-1111-1111-111111111111
144	FAC-20260331-1227	\N	3	39	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 02:22:03.83815+00	12	69	2026-04-01 02:22:03.83815+00	\N	2026-04-01 02:22:03.83815+00	11111111-1111-1111-1111-111111111111
145	FAC-20260331-6515	\N	3	39	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 02:35:09.097096+00	2	72	2026-04-01 02:35:09.097096+00	\N	2026-04-01 02:35:09.097096+00	11111111-1111-1111-1111-111111111111
146	FAC-20260331-5521	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 02:43:28.139775+00	5	67	2026-04-01 02:43:28.139775+00	\N	2026-04-01 02:43:28.139775+00	11111111-1111-1111-1111-111111111111
147	FAC-20260331-8986	\N	3	39	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 03:07:11.566808+00	5	73	2026-04-01 03:07:11.566808+00	\N	2026-04-01 03:07:11.566808+00	11111111-1111-1111-1111-111111111111
148	FAC-20260331-4737	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 03:19:57.43657+00	\N	\N	2026-04-01 03:19:57.43657+00	\N	2026-04-01 03:19:57.43657+00	11111111-1111-1111-1111-111111111111
149	FAC-20260331-4586	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 03:38:07.112899+00	5	75	2026-04-01 03:38:07.112899+00	\N	2026-04-01 03:38:07.112899+00	11111111-1111-1111-1111-111111111111
150	FAC-20260331-9985	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 03:45:42.752958+00	\N	\N	2026-04-01 03:45:42.752958+00	\N	2026-04-01 03:45:42.752958+00	11111111-1111-1111-1111-111111111111
151	FAC-20260331-6222	\N	3	39	1200	0	0	1200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 04:03:58.731834+00	1	71	2026-04-01 04:03:58.731834+00	\N	2026-04-01 04:03:58.731834+00	11111111-1111-1111-1111-111111111111
152	FAC-20260331-6574	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 04:06:29.082373+00	\N	\N	2026-04-01 04:06:29.082373+00	\N	2026-04-01 04:06:29.082373+00	11111111-1111-1111-1111-111111111111
153	FAC-20260331-2404	\N	3	39	750	0	0	750	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 04:06:54.909632+00	4	66	2026-04-01 04:06:54.909632+00	\N	2026-04-01 04:06:54.909632+00	11111111-1111-1111-1111-111111111111
154	FAC-20260331-4246	\N	3	39	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 04:08:06.778879+00	12	74	2026-04-01 04:08:06.778879+00	\N	2026-04-01 04:08:06.778879+00	11111111-1111-1111-1111-111111111111
155	FAC-20260331-3583	\N	3	39	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 04:11:16.091457+00	5	76	2026-04-01 04:11:16.091457+00	\N	2026-04-01 04:11:16.091457+00	11111111-1111-1111-1111-111111111111
156	FAC-20260331-3573	\N	3	39	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 04:12:36.095385+00	\N	\N	2026-04-01 04:12:36.095385+00	\N	2026-04-01 04:12:36.095385+00	11111111-1111-1111-1111-111111111111
157	FAC-20260331-9800	\N	3	39	100	0	0	100	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 04:17:02.297764+00	3	62	2026-04-01 04:17:02.297764+00	\N	2026-04-01 04:17:02.297764+00	11111111-1111-1111-1111-111111111111
158	FAC-20260331-0513	\N	3	39	100	0	0	100	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 04:17:23.00718+00	13	68	2026-04-01 04:17:23.00718+00	\N	2026-04-01 04:17:23.00718+00	11111111-1111-1111-1111-111111111111
159	FAC-20260401-1273	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 22:28:05.761648+00	3	77	2026-04-01 22:28:05.761648+00	\N	2026-04-01 22:28:05.761648+00	11111111-1111-1111-1111-111111111111
160	FAC-20260401-8800	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 22:28:53.298388+00	\N	\N	2026-04-01 22:28:53.298388+00	\N	2026-04-01 22:28:53.298388+00	11111111-1111-1111-1111-111111111111
161	FAC-20260401-6345	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 22:41:30.844174+00	3	78	2026-04-01 22:41:30.844174+00	\N	2026-04-01 22:41:30.844174+00	11111111-1111-1111-1111-111111111111
162	FAC-20260401-8087	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 22:52:42.658174+00	\N	\N	2026-04-01 22:52:42.658174+00	\N	2026-04-01 22:52:42.658174+00	11111111-1111-1111-1111-111111111111
163	FAC-20260401-8423	\N	3	40	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 22:58:22.862802+00	4	80	2026-04-01 22:58:22.862802+00	\N	2026-04-01 22:58:22.862802+00	11111111-1111-1111-1111-111111111111
164	FAC-20260401-4208	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 23:01:48.738772+00	\N	\N	2026-04-01 23:01:48.738772+00	\N	2026-04-01 23:01:48.738772+00	11111111-1111-1111-1111-111111111111
165	FAC-20260401-4861	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 23:02:29.30029+00	5	81	2026-04-01 23:02:29.30029+00	\N	2026-04-01 23:02:29.30029+00	11111111-1111-1111-1111-111111111111
166	FAC-20260401-6700	\N	3	40	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 23:16:11.340224+00	\N	\N	2026-04-01 23:16:11.340224+00	\N	2026-04-01 23:16:11.340224+00	11111111-1111-1111-1111-111111111111
167	FAC-20260401-8880	\N	3	40	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 23:17:33.312862+00	3	79	2026-04-01 23:17:33.312862+00	\N	2026-04-01 23:17:33.312862+00	11111111-1111-1111-1111-111111111111
168	FAC-20260401-0363	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 23:19:14.801727+00	\N	\N	2026-04-01 23:19:14.801727+00	\N	2026-04-01 23:19:14.801727+00	11111111-1111-1111-1111-111111111111
169	FAC-20260401-0381	\N	3	40	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 23:42:35.043736+00	\N	\N	2026-04-01 23:42:35.043736+00	\N	2026-04-01 23:42:35.043736+00	11111111-1111-1111-1111-111111111111
170	FAC-20260401-9813	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 23:46:44.2392+00	\N	\N	2026-04-01 23:46:44.2392+00	\N	2026-04-01 23:46:44.2392+00	11111111-1111-1111-1111-111111111111
171	FAC-20260401-2297	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 23:51:16.756578+00	\N	\N	2026-04-01 23:51:16.756578+00	\N	2026-04-01 23:51:16.756578+00	11111111-1111-1111-1111-111111111111
172	FAC-20260401-3421	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-01 23:54:28.148806+00	\N	\N	2026-04-01 23:54:28.148806+00	\N	2026-04-01 23:54:28.148806+00	11111111-1111-1111-1111-111111111111
173	FAC-20260401-5711	\N	3	40	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 00:08:50.110938+00	\N	\N	2026-04-02 00:08:50.110938+00	\N	2026-04-02 00:08:50.110938+00	11111111-1111-1111-1111-111111111111
174	FAC-20260401-2581	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 00:09:36.993537+00	\N	\N	2026-04-02 00:09:36.993537+00	\N	2026-04-02 00:09:36.993537+00	11111111-1111-1111-1111-111111111111
175	FAC-20260401-1728	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 00:21:26.120535+00	\N	\N	2026-04-02 00:21:26.120535+00	\N	2026-04-02 00:21:26.120535+00	11111111-1111-1111-1111-111111111111
176	FAC-20260401-2895	\N	3	40	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 00:22:27.420638+00	\N	\N	2026-04-02 00:22:27.420638+00	\N	2026-04-02 00:22:27.420638+00	11111111-1111-1111-1111-111111111111
177	FAC-20260401-3301	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 00:28:27.698886+00	\N	\N	2026-04-02 00:28:27.698886+00	\N	2026-04-02 00:28:27.698886+00	11111111-1111-1111-1111-111111111111
178	FAC-20260401-3104	\N	3	40	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 00:35:37.563+00	\N	\N	2026-04-02 00:35:37.563+00	\N	2026-04-02 00:35:37.563+00	11111111-1111-1111-1111-111111111111
179	FAC-20260401-6240	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 01:01:40.673558+00	\N	\N	2026-04-02 01:01:40.673558+00	\N	2026-04-02 01:01:40.673558+00	11111111-1111-1111-1111-111111111111
180	FAC-20260401-9509	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 01:02:23.905618+00	4	83	2026-04-02 01:02:23.905618+00	\N	2026-04-02 01:02:23.905618+00	11111111-1111-1111-1111-111111111111
181	FAC-20260401-9927	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 01:08:24.29129+00	\N	\N	2026-04-02 01:08:24.29129+00	\N	2026-04-02 01:08:24.29129+00	11111111-1111-1111-1111-111111111111
182	FAC-20260401-8029	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 01:13:42.388986+00	4	86	2026-04-02 01:13:42.388986+00	\N	2026-04-02 01:13:42.388986+00	11111111-1111-1111-1111-111111111111
183	FAC-20260401-2382	\N	3	40	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 01:23:36.958448+00	\N	\N	2026-04-02 01:23:36.958448+00	\N	2026-04-02 01:23:36.958448+00	11111111-1111-1111-1111-111111111111
184	FAC-20260401-2558	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 01:27:06.922783+00	\N	\N	2026-04-02 01:27:06.922783+00	\N	2026-04-02 01:27:06.922783+00	11111111-1111-1111-1111-111111111111
185	FAC-20260401-6334	\N	3	40	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 01:35:30.765044+00	\N	\N	2026-04-02 01:35:30.765044+00	\N	2026-04-02 01:35:30.765044+00	11111111-1111-1111-1111-111111111111
186	FAC-20260401-4026	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 01:35:58.359767+00	4	87	2026-04-02 01:35:58.359767+00	\N	2026-04-02 01:35:58.359767+00	11111111-1111-1111-1111-111111111111
187	FAC-20260401-1373	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 01:46:35.753004+00	4	89	2026-04-02 01:46:35.753004+00	\N	2026-04-02 01:46:35.753004+00	11111111-1111-1111-1111-111111111111
188	FAC-20260401-1831	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 01:50:36.169356+00	\N	\N	2026-04-02 01:50:36.169356+00	\N	2026-04-02 01:50:36.169356+00	11111111-1111-1111-1111-111111111111
189	FAC-20260401-1758	\N	3	40	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:02:16.112074+00	\N	\N	2026-04-02 02:02:16.112074+00	\N	2026-04-02 02:02:16.112074+00	11111111-1111-1111-1111-111111111111
190	FAC-20260401-8173	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:03:12.5173+00	\N	\N	2026-04-02 02:03:12.5173+00	\N	2026-04-02 02:03:12.5173+00	11111111-1111-1111-1111-111111111111
191	FAC-20260401-5572	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:04:19.888228+00	13	88	2026-04-02 02:04:19.888228+00	\N	2026-04-02 02:04:19.888228+00	11111111-1111-1111-1111-111111111111
192	FAC-20260401-1232	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:05:35.542695+00	4	90	2026-04-02 02:05:35.542695+00	\N	2026-04-02 02:05:35.542695+00	11111111-1111-1111-1111-111111111111
193	FAC-20260401-8506	\N	3	40	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:07:22.819994+00	\N	\N	2026-04-02 02:07:22.819994+00	\N	2026-04-02 02:07:22.819994+00	11111111-1111-1111-1111-111111111111
194	FAC-20260401-4868	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:20:09.181593+00	\N	\N	2026-04-02 02:20:09.181593+00	\N	2026-04-02 02:20:09.181593+00	11111111-1111-1111-1111-111111111111
195	FAC-20260401-6093	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:20:10.44196+00	\N	\N	2026-04-02 02:20:10.44196+00	\N	2026-04-02 02:20:10.44196+00	11111111-1111-1111-1111-111111111111
196	FAC-20260401-8082	\N	3	40	550	0	0	550	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:32:42.515669+00	12	91	2026-04-02 02:32:42.515669+00	\N	2026-04-02 02:32:42.515669+00	11111111-1111-1111-1111-111111111111
197	FAC-20260401-5129	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:47:00.231667+00	\N	\N	2026-04-02 02:47:00.231667+00	\N	2026-04-02 02:47:00.231667+00	11111111-1111-1111-1111-111111111111
198	FAC-20260401-4478	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:47:58.801041+00	\N	\N	2026-04-02 02:47:58.801041+00	\N	2026-04-02 02:47:58.801041+00	11111111-1111-1111-1111-111111111111
199	FAC-20260401-6507	\N	3	40	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 02:49:20.8637+00	\N	\N	2026-04-02 02:49:20.8637+00	\N	2026-04-02 02:49:20.8637+00	11111111-1111-1111-1111-111111111111
200	FAC-20260401-3761	\N	3	40	350	0	0	350	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 03:10:38.165391+00	4	92	2026-04-02 03:10:38.165391+00	\N	2026-04-02 03:10:38.165391+00	11111111-1111-1111-1111-111111111111
201	FAC-20260401-1184	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 03:17:05.513346+00	\N	\N	2026-04-02 03:17:05.513346+00	\N	2026-04-02 03:17:05.513346+00	11111111-1111-1111-1111-111111111111
202	FAC-20260401-8262	\N	3	40	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 03:19:12.549289+00	\N	\N	2026-04-02 03:19:12.549289+00	\N	2026-04-02 03:19:12.549289+00	11111111-1111-1111-1111-111111111111
203	FAC-20260401-6317	\N	3	40	3000	0	0	3000	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 03:48:30.592505+00	3	82	2026-04-02 03:48:30.592505+00	\N	2026-04-02 03:48:30.592505+00	11111111-1111-1111-1111-111111111111
204	FAC-20260401-2145	\N	3	40	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 03:54:56.406868+00	5	84	2026-04-02 03:54:56.406868+00	\N	2026-04-02 03:54:56.406868+00	11111111-1111-1111-1111-111111111111
205	FAC-20260402-1860	\N	3	41	15	0	0	15	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 21:15:04.439772+00	\N	\N	2026-04-02 21:15:04.439772+00	\N	2026-04-02 21:15:04.439772+00	11111111-1111-1111-1111-111111111111
206	FAC-20260402-3480	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 21:47:46.034379+00	\N	\N	2026-04-02 21:47:46.034379+00	\N	2026-04-02 21:47:46.034379+00	11111111-1111-1111-1111-111111111111
207	FAC-20260402-5738	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 22:04:18.281967+00	\N	\N	2026-04-02 22:04:18.281967+00	\N	2026-04-02 22:04:18.281967+00	11111111-1111-1111-1111-111111111111
208	FAC-20260402-1386	\N	3	41	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 22:18:43.791157+00	3	93	2026-04-02 22:18:43.791157+00	\N	2026-04-02 22:18:43.791157+00	11111111-1111-1111-1111-111111111111
209	FAC-20260402-8758	\N	3	41	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 22:48:21.104968+00	4	94	2026-04-02 22:48:21.104968+00	\N	2026-04-02 22:48:21.104968+00	11111111-1111-1111-1111-111111111111
210	FAC-20260402-5663	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 22:48:58.005828+00	\N	\N	2026-04-02 22:48:58.005828+00	\N	2026-04-02 22:48:58.005828+00	11111111-1111-1111-1111-111111111111
211	FAC-20260402-2927	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 23:06:45.271052+00	\N	\N	2026-04-02 23:06:45.271052+00	\N	2026-04-02 23:06:45.271052+00	11111111-1111-1111-1111-111111111111
212	FAC-20260402-0132	\N	3	41	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 23:07:32.441372+00	3	95	2026-04-02 23:07:32.441372+00	\N	2026-04-02 23:07:32.441372+00	11111111-1111-1111-1111-111111111111
213	FAC-20260402-3840	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 23:12:36.225125+00	\N	\N	2026-04-02 23:12:36.225125+00	\N	2026-04-02 23:12:36.225125+00	11111111-1111-1111-1111-111111111111
214	FAC-20260402-9852	\N	3	41	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 23:13:12.430966+00	\N	\N	2026-04-02 23:13:12.430966+00	\N	2026-04-02 23:13:12.430966+00	11111111-1111-1111-1111-111111111111
215	FAC-20260402-7864	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 23:20:30.194779+00	\N	\N	2026-04-02 23:20:30.194779+00	\N	2026-04-02 23:20:30.194779+00	11111111-1111-1111-1111-111111111111
216	FAC-20260402-8430	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 23:21:00.714214+00	\N	\N	2026-04-02 23:21:00.714214+00	\N	2026-04-02 23:21:00.714214+00	11111111-1111-1111-1111-111111111111
217	FAC-20260402-0850	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 23:37:33.349118+00	\N	\N	2026-04-02 23:37:33.349118+00	\N	2026-04-02 23:37:33.349118+00	11111111-1111-1111-1111-111111111111
218	FAC-20260402-5269	\N	3	41	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-02 23:41:17.631612+00	\N	\N	2026-04-02 23:41:17.631612+00	\N	2026-04-02 23:41:17.631612+00	11111111-1111-1111-1111-111111111111
219	FAC-20260402-6514	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 00:05:08.886975+00	\N	\N	2026-04-03 00:05:08.886975+00	\N	2026-04-03 00:05:08.886975+00	11111111-1111-1111-1111-111111111111
220	FAC-20260402-8974	\N	3	41	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 00:05:31.221387+00	\N	\N	2026-04-03 00:05:31.221387+00	\N	2026-04-03 00:05:31.221387+00	11111111-1111-1111-1111-111111111111
221	FAC-20260402-8793	\N	3	41	15	0	0	15	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 00:15:01.327472+00	\N	\N	2026-04-03 00:15:01.327472+00	\N	2026-04-03 00:15:01.327472+00	11111111-1111-1111-1111-111111111111
222	FAC-20260402-3249	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 00:24:55.63883+00	\N	\N	2026-04-03 00:24:55.63883+00	\N	2026-04-03 00:24:55.63883+00	11111111-1111-1111-1111-111111111111
223	FAC-20260402-2241	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 00:28:34.473504+00	3	96	2026-04-03 00:28:34.473504+00	\N	2026-04-03 00:28:34.473504+00	11111111-1111-1111-1111-111111111111
224	FAC-20260402-1579	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 00:35:04.078832+00	\N	\N	2026-04-03 00:35:04.078832+00	\N	2026-04-03 00:35:04.078832+00	11111111-1111-1111-1111-111111111111
225	FAC-20260402-5211	\N	3	41	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 00:38:47.442995+00	\N	\N	2026-04-03 00:38:47.442995+00	\N	2026-04-03 00:38:47.442995+00	11111111-1111-1111-1111-111111111111
226	FAC-20260402-4947	\N	3	41	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 00:41:37.224506+00	\N	\N	2026-04-03 00:41:37.224506+00	\N	2026-04-03 00:41:37.224506+00	11111111-1111-1111-1111-111111111111
227	FAC-20260402-3208	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 00:53:15.416604+00	4	98	2026-04-03 00:53:15.416604+00	\N	2026-04-03 00:53:15.416604+00	11111111-1111-1111-1111-111111111111
228	FAC-20260402-7742	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 00:55:10.383466+00	\N	\N	2026-04-03 00:55:10.383466+00	\N	2026-04-03 00:55:10.383466+00	11111111-1111-1111-1111-111111111111
229	FAC-20260402-5331	\N	3	41	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:05:27.601743+00	\N	\N	2026-04-03 01:05:27.601743+00	\N	2026-04-03 01:05:27.601743+00	11111111-1111-1111-1111-111111111111
230	FAC-20260402-3781	\N	3	41	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:05:55.982902+00	5	99	2026-04-03 01:05:55.982902+00	\N	2026-04-03 01:05:55.982902+00	11111111-1111-1111-1111-111111111111
231	FAC-20260402-1188	\N	3	41	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:06:23.390763+00	\N	\N	2026-04-03 01:06:23.390763+00	\N	2026-04-03 01:06:23.390763+00	11111111-1111-1111-1111-111111111111
232	FAC-20260402-3572	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:12:25.778264+00	\N	\N	2026-04-03 01:12:25.778264+00	\N	2026-04-03 01:12:25.778264+00	11111111-1111-1111-1111-111111111111
233	FAC-20260402-9642	\N	3	41	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:15:01.973017+00	\N	\N	2026-04-03 01:15:01.973017+00	\N	2026-04-03 01:15:01.973017+00	11111111-1111-1111-1111-111111111111
234	FAC-20260402-5612	\N	3	41	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:21:07.830398+00	3	97	2026-04-03 01:21:07.830398+00	\N	2026-04-03 01:21:07.830398+00	11111111-1111-1111-1111-111111111111
235	FAC-20260402-3853	\N	3	41	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:23:46.036457+00	1	102	2026-04-03 01:23:46.036457+00	\N	2026-04-03 01:23:46.036457+00	11111111-1111-1111-1111-111111111111
236	FAC-20260402-3306	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:26:05.542852+00	\N	\N	2026-04-03 01:26:05.542852+00	\N	2026-04-03 01:26:05.542852+00	11111111-1111-1111-1111-111111111111
237	FAC-20260402-4474	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:26:36.678625+00	\N	\N	2026-04-03 01:26:36.678625+00	\N	2026-04-03 01:26:36.678625+00	11111111-1111-1111-1111-111111111111
238	FAC-20260402-5357	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:29:57.536018+00	3	104	2026-04-03 01:29:57.536018+00	\N	2026-04-03 01:29:57.536018+00	11111111-1111-1111-1111-111111111111
239	FAC-20260402-0711	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:33:22.903258+00	\N	\N	2026-04-03 01:33:22.903258+00	\N	2026-04-03 01:33:22.903258+00	11111111-1111-1111-1111-111111111111
240	FAC-20260402-0527	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:39:12.720972+00	\N	\N	2026-04-03 01:39:12.720972+00	\N	2026-04-03 01:39:12.720972+00	11111111-1111-1111-1111-111111111111
241	FAC-20260402-3867	\N	3	41	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:42:46.093893+00	\N	\N	2026-04-03 01:42:46.093893+00	\N	2026-04-03 01:42:46.093893+00	11111111-1111-1111-1111-111111111111
242	FAC-20260402-4207	\N	3	41	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:47:06.526464+00	\N	\N	2026-04-03 01:47:06.526464+00	\N	2026-04-03 01:47:06.526464+00	11111111-1111-1111-1111-111111111111
243	FAC-20260402-0630	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:50:43.028057+00	\N	\N	2026-04-03 01:50:43.028057+00	\N	2026-04-03 01:50:43.028057+00	11111111-1111-1111-1111-111111111111
244	FAC-20260402-7946	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:52:10.153846+00	\N	\N	2026-04-03 01:52:10.153846+00	\N	2026-04-03 01:52:10.153846+00	11111111-1111-1111-1111-111111111111
245	FAC-20260402-0162	\N	3	41	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:54:42.34072+00	\N	\N	2026-04-03 01:54:42.34072+00	\N	2026-04-03 01:54:42.34072+00	11111111-1111-1111-1111-111111111111
246	FAC-20260402-8627	\N	3	41	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 01:55:10.791403+00	\N	\N	2026-04-03 01:55:10.791403+00	\N	2026-04-03 01:55:10.791403+00	11111111-1111-1111-1111-111111111111
247	FAC-20260402-1638	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:00:43.815557+00	\N	\N	2026-04-03 02:00:43.815557+00	\N	2026-04-03 02:00:43.815557+00	11111111-1111-1111-1111-111111111111
248	FAC-20260402-4952	\N	3	41	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:03:07.121212+00	13	100	2026-04-03 02:03:07.121212+00	\N	2026-04-03 02:03:07.121212+00	11111111-1111-1111-1111-111111111111
249	FAC-20260402-6776	\N	3	41	1050	0	0	1050	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:04:18.933186+00	2	103	2026-04-03 02:04:18.933186+00	\N	2026-04-03 02:04:18.933186+00	11111111-1111-1111-1111-111111111111
250	FAC-20260402-7020	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:05:29.266622+00	\N	\N	2026-04-03 02:05:29.266622+00	\N	2026-04-03 02:05:29.266622+00	11111111-1111-1111-1111-111111111111
251	FAC-20260402-3038	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:15:05.205819+00	\N	\N	2026-04-03 02:15:05.205819+00	\N	2026-04-03 02:15:05.205819+00	11111111-1111-1111-1111-111111111111
252	FAC-20260402-2689	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:15:34.835078+00	\N	\N	2026-04-03 02:15:34.835078+00	\N	2026-04-03 02:15:34.835078+00	11111111-1111-1111-1111-111111111111
253	FAC-20260402-2498	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:17:04.68677+00	4	106	2026-04-03 02:17:04.68677+00	\N	2026-04-03 02:17:04.68677+00	11111111-1111-1111-1111-111111111111
254	FAC-20260402-7501	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:20:09.643549+00	\N	\N	2026-04-03 02:20:09.643549+00	\N	2026-04-03 02:20:09.643549+00	11111111-1111-1111-1111-111111111111
255	FAC-20260402-4167	\N	3	41	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:20:36.462671+00	3	105	2026-04-03 02:20:36.462671+00	\N	2026-04-03 02:20:36.462671+00	11111111-1111-1111-1111-111111111111
256	FAC-20260402-3137	\N	3	41	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:23:35.423345+00	\N	\N	2026-04-03 02:23:35.423345+00	\N	2026-04-03 02:23:35.423345+00	11111111-1111-1111-1111-111111111111
257	FAC-20260402-1511	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:35:03.894014+00	\N	\N	2026-04-03 02:35:03.894014+00	\N	2026-04-03 02:35:03.894014+00	11111111-1111-1111-1111-111111111111
258	FAC-20260402-0280	\N	3	41	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 02:42:52.696528+00	\N	\N	2026-04-03 02:42:52.696528+00	\N	2026-04-03 02:42:52.696528+00	11111111-1111-1111-1111-111111111111
259	FAC-20260402-4953	\N	3	41	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 03:19:27.068445+00	3	107	2026-04-03 03:19:27.068445+00	\N	2026-04-03 03:19:27.068445+00	11111111-1111-1111-1111-111111111111
260	FAC-20260402-9191	\N	3	41	1050	0	0	1050	efectivo	contado	completada	\N	\N	\N	\N	2026-04-03 03:23:31.518934+00	4	108	2026-04-03 03:23:31.518934+00	\N	2026-04-03 03:23:31.518934+00	11111111-1111-1111-1111-111111111111
261	FAC-20260404-9196	\N	3	42	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 19:35:02.662679+00	3	109	2026-04-04 19:35:02.662679+00	\N	2026-04-04 19:35:02.662679+00	11111111-1111-1111-1111-111111111111
265	FAC-20260404-3001	\N	3	42	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 20:49:06.563338+00	3	110	2026-04-04 20:49:06.563338+00	\N	2026-04-04 20:49:06.563338+00	11111111-1111-1111-1111-111111111111
264	FAC-20260404-1767	\N	3	42	150	0	0	150	efectivo	contado	cancelada	\N	\N	\N	\N	2026-04-04 19:35:05.086289+00	3	109	2026-04-04 19:35:05.086289+00	\N	2026-04-04 19:35:05.086289+00	11111111-1111-1111-1111-111111111111
263	FAC-20260404-1150	\N	3	42	150	0	0	150	efectivo	contado	cancelada	\N	\N	\N	\N	2026-04-04 19:35:04.502183+00	3	109	2026-04-04 19:35:04.502183+00	\N	2026-04-04 19:35:04.502183+00	11111111-1111-1111-1111-111111111111
262	FAC-20260404-0213	\N	3	42	150	0	0	150	efectivo	contado	cancelada	\N	\N	\N	\N	2026-04-04 19:35:03.560693+00	3	109	2026-04-04 19:35:03.560693+00	\N	2026-04-04 19:35:03.560693+00	11111111-1111-1111-1111-111111111111
266	FAC-20260404-4921	\N	3	42	400	0	0	400	efectivo	contado	cancelada	\N	\N	\N	\N	2026-04-04 20:49:08.216532+00	3	110	2026-04-04 20:49:08.216532+00	\N	2026-04-04 20:49:08.216532+00	11111111-1111-1111-1111-111111111111
267	FAC-20260404-4286	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 21:17:58.5107+00	\N	\N	2026-04-04 21:17:58.5107+00	\N	2026-04-04 21:17:58.5107+00	11111111-1111-1111-1111-111111111111
268	FAC-20260404-8647	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 21:45:12.964938+00	\N	\N	2026-04-04 21:45:12.964938+00	\N	2026-04-04 21:45:12.964938+00	11111111-1111-1111-1111-111111111111
269	FAC-20260404-9925	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 21:46:34.132434+00	\N	\N	2026-04-04 21:46:34.132434+00	\N	2026-04-04 21:46:34.132434+00	11111111-1111-1111-1111-111111111111
270	FAC-20260404-6821	\N	3	43	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 22:04:11.292769+00	\N	\N	2026-04-04 22:04:11.292769+00	\N	2026-04-04 22:04:11.292769+00	11111111-1111-1111-1111-111111111111
271	FAC-20260404-1955	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 22:18:06.265102+00	\N	\N	2026-04-04 22:18:06.265102+00	\N	2026-04-04 22:18:06.265102+00	11111111-1111-1111-1111-111111111111
272	FAC-20260404-8872	\N	3	43	750	0	0	750	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 22:20:52.996998+00	3	112	2026-04-04 22:20:52.996998+00	\N	2026-04-04 22:20:52.996998+00	11111111-1111-1111-1111-111111111111
273	FAC-20260404-6293	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 22:27:30.679025+00	\N	\N	2026-04-04 22:27:30.679025+00	\N	2026-04-04 22:27:30.679025+00	11111111-1111-1111-1111-111111111111
274	FAC-20260404-5556	\N	3	43	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 22:28:19.756041+00	\N	\N	2026-04-04 22:28:19.756041+00	\N	2026-04-04 22:28:19.756041+00	11111111-1111-1111-1111-111111111111
275	FAC-20260404-6756	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 22:29:00.932071+00	\N	\N	2026-04-04 22:29:00.932071+00	\N	2026-04-04 22:29:00.932071+00	11111111-1111-1111-1111-111111111111
276	FAC-20260404-6389	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 22:29:20.508035+00	4	113	2026-04-04 22:29:20.508035+00	\N	2026-04-04 22:29:20.508035+00	11111111-1111-1111-1111-111111111111
277	FAC-20260404-9560	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 22:42:53.720876+00	\N	\N	2026-04-04 22:42:53.720876+00	\N	2026-04-04 22:42:53.720876+00	11111111-1111-1111-1111-111111111111
278	FAC-20260404-6642	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 22:43:20.74879+00	3	116	2026-04-04 22:43:20.74879+00	\N	2026-04-04 22:43:20.74879+00	11111111-1111-1111-1111-111111111111
279	FAC-20260404-9446	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 22:58:53.544198+00	\N	\N	2026-04-04 22:58:53.544198+00	\N	2026-04-04 22:58:53.544198+00	11111111-1111-1111-1111-111111111111
280	FAC-20260404-5835	\N	3	43	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:05:00.044759+00	\N	\N	2026-04-04 23:05:00.044759+00	\N	2026-04-04 23:05:00.044759+00	11111111-1111-1111-1111-111111111111
281	FAC-20260404-5980	\N	3	43	15	0	0	15	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:08:10.078054+00	\N	\N	2026-04-04 23:08:10.078054+00	\N	2026-04-04 23:08:10.078054+00	11111111-1111-1111-1111-111111111111
282	FAC-20260404-8960	\N	3	43	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:15:23.072154+00	13	118	2026-04-04 23:15:23.072154+00	\N	2026-04-04 23:15:23.072154+00	11111111-1111-1111-1111-111111111111
283	FAC-20260404-9280	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:15:43.357315+00	\N	\N	2026-04-04 23:15:43.357315+00	\N	2026-04-04 23:15:43.357315+00	11111111-1111-1111-1111-111111111111
284	FAC-20260404-9721	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:18:13.841307+00	\N	\N	2026-04-04 23:18:13.841307+00	\N	2026-04-04 23:18:13.841307+00	11111111-1111-1111-1111-111111111111
285	FAC-20260404-8184	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:21:32.291745+00	\N	\N	2026-04-04 23:21:32.291745+00	\N	2026-04-04 23:21:32.291745+00	11111111-1111-1111-1111-111111111111
286	FAC-20260404-2390	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:26:36.640351+00	\N	\N	2026-04-04 23:26:36.640351+00	\N	2026-04-04 23:26:36.640351+00	11111111-1111-1111-1111-111111111111
287	FAC-20260404-1303	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:28:35.370054+00	\N	\N	2026-04-04 23:28:35.370054+00	\N	2026-04-04 23:28:35.370054+00	11111111-1111-1111-1111-111111111111
288	FAC-20260404-5651	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:38:39.888747+00	\N	\N	2026-04-04 23:38:39.888747+00	\N	2026-04-04 23:38:39.888747+00	11111111-1111-1111-1111-111111111111
289	FAC-20260404-0764	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:47:35.013976+00	\N	\N	2026-04-04 23:47:35.013976+00	\N	2026-04-04 23:47:35.013976+00	11111111-1111-1111-1111-111111111111
290	FAC-20260404-0377	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-04 23:53:44.733793+00	\N	\N	2026-04-04 23:53:44.733793+00	\N	2026-04-04 23:53:44.733793+00	11111111-1111-1111-1111-111111111111
291	FAC-20260404-4480	\N	3	43	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:02:28.523834+00	13	120	2026-04-05 00:02:28.523834+00	\N	2026-04-05 00:02:28.523834+00	11111111-1111-1111-1111-111111111111
292	FAC-20260404-3415	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:04:07.479627+00	\N	\N	2026-04-05 00:04:07.479627+00	\N	2026-04-05 00:04:07.479627+00	11111111-1111-1111-1111-111111111111
293	FAC-20260404-4692	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:07:08.721744+00	\N	\N	2026-04-05 00:07:08.721744+00	\N	2026-04-05 00:07:08.721744+00	11111111-1111-1111-1111-111111111111
294	FAC-20260404-2059	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:18:26.15633+00	\N	\N	2026-04-05 00:18:26.15633+00	\N	2026-04-05 00:18:26.15633+00	11111111-1111-1111-1111-111111111111
295	FAC-20260404-8883	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:25:12.898915+00	13	122	2026-04-05 00:25:12.898915+00	\N	2026-04-05 00:25:12.898915+00	11111111-1111-1111-1111-111111111111
296	FAC-20260404-2079	\N	3	43	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:26:16.108538+00	\N	\N	2026-04-05 00:26:16.108538+00	\N	2026-04-05 00:26:16.108538+00	11111111-1111-1111-1111-111111111111
297	FAC-20260404-1760	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:26:45.779503+00	\N	\N	2026-04-05 00:26:45.779503+00	\N	2026-04-05 00:26:45.779503+00	11111111-1111-1111-1111-111111111111
298	FAC-20260404-1205	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:31:35.288709+00	\N	\N	2026-04-05 00:31:35.288709+00	\N	2026-04-05 00:31:35.288709+00	11111111-1111-1111-1111-111111111111
299	FAC-20260404-6881	\N	3	43	3700	0	0	3700	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:40:30.882+00	5	114	2026-04-05 00:40:30.882+00	\N	2026-04-05 00:40:30.882+00	11111111-1111-1111-1111-111111111111
300	FAC-20260404-8376	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:43:42.678619+00	\N	\N	2026-04-05 00:43:42.678619+00	\N	2026-04-05 00:43:42.678619+00	11111111-1111-1111-1111-111111111111
301	FAC-20260404-1567	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:46:55.582288+00	13	123	2026-04-05 00:46:55.582288+00	\N	2026-04-05 00:46:55.582288+00	11111111-1111-1111-1111-111111111111
302	FAC-20260404-4814	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:51:08.817048+00	\N	\N	2026-04-05 00:51:08.817048+00	\N	2026-04-05 00:51:08.817048+00	11111111-1111-1111-1111-111111111111
303	FAC-20260404-9700	\N	3	43	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:53:53.70733+00	\N	\N	2026-04-05 00:53:53.70733+00	\N	2026-04-05 00:53:53.70733+00	11111111-1111-1111-1111-111111111111
304	FAC-20260404-2908	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:56:16.926414+00	\N	\N	2026-04-05 00:56:16.926414+00	\N	2026-04-05 00:56:16.926414+00	11111111-1111-1111-1111-111111111111
305	FAC-20260404-8082	\N	3	43	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:56:42.06366+00	\N	\N	2026-04-05 00:56:42.06366+00	\N	2026-04-05 00:56:42.06366+00	11111111-1111-1111-1111-111111111111
306	FAC-20260404-9329	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 00:57:13.326472+00	\N	\N	2026-04-05 00:57:13.326472+00	\N	2026-04-05 00:57:13.326472+00	11111111-1111-1111-1111-111111111111
307	FAC-20260404-2835	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:01:06.823759+00	\N	\N	2026-04-05 01:01:06.823759+00	\N	2026-04-05 01:01:06.823759+00	11111111-1111-1111-1111-111111111111
308	FAC-20260404-9481	\N	3	43	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:02:33.467776+00	\N	\N	2026-04-05 01:02:33.467776+00	\N	2026-04-05 01:02:33.467776+00	11111111-1111-1111-1111-111111111111
309	FAC-20260404-5316	\N	3	43	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:09:19.323891+00	\N	\N	2026-04-05 01:09:19.323891+00	\N	2026-04-05 01:09:19.323891+00	11111111-1111-1111-1111-111111111111
310	FAC-20260404-3892	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:15:38.029772+00	\N	\N	2026-04-05 01:15:38.029772+00	\N	2026-04-05 01:15:38.029772+00	11111111-1111-1111-1111-111111111111
311	FAC-20260404-4787	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:17:18.744696+00	\N	\N	2026-04-05 01:17:18.744696+00	\N	2026-04-05 01:17:18.744696+00	11111111-1111-1111-1111-111111111111
312	FAC-20260404-3745	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:19:47.76254+00	\N	\N	2026-04-05 01:19:47.76254+00	\N	2026-04-05 01:19:47.76254+00	11111111-1111-1111-1111-111111111111
313	FAC-20260404-9590	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:21:23.564884+00	\N	\N	2026-04-05 01:21:23.564884+00	\N	2026-04-05 01:21:23.564884+00	11111111-1111-1111-1111-111111111111
314	FAC-20260404-2328	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:27:56.538006+00	\N	\N	2026-04-05 01:27:56.538006+00	\N	2026-04-05 01:27:56.538006+00	11111111-1111-1111-1111-111111111111
315	FAC-20260404-2226	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:28:46.231327+00	\N	\N	2026-04-05 01:28:46.231327+00	\N	2026-04-05 01:28:46.231327+00	11111111-1111-1111-1111-111111111111
316	FAC-20260404-4270	\N	3	43	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:30:48.251638+00	\N	\N	2026-04-05 01:30:48.251638+00	\N	2026-04-05 01:30:48.251638+00	11111111-1111-1111-1111-111111111111
317	FAC-20260404-2456	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:41:26.417444+00	\N	\N	2026-04-05 01:41:26.417444+00	\N	2026-04-05 01:41:26.417444+00	11111111-1111-1111-1111-111111111111
318	FAC-20260404-0052	\N	3	43	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:41:54.004244+00	\N	\N	2026-04-05 01:41:54.004244+00	\N	2026-04-05 01:41:54.004244+00	11111111-1111-1111-1111-111111111111
319	FAC-20260404-8865	\N	3	43	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:46:23.083448+00	\N	\N	2026-04-05 01:46:23.083448+00	\N	2026-04-05 01:46:23.083448+00	11111111-1111-1111-1111-111111111111
320	FAC-20260404-7205	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:49:11.144614+00	\N	\N	2026-04-05 01:49:11.144614+00	\N	2026-04-05 01:49:11.144614+00	11111111-1111-1111-1111-111111111111
321	FAC-20260404-2281	\N	3	43	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:50:56.344109+00	\N	\N	2026-04-05 01:50:56.344109+00	\N	2026-04-05 01:50:56.344109+00	11111111-1111-1111-1111-111111111111
322	FAC-20260404-5532	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 01:52:19.510596+00	\N	\N	2026-04-05 01:52:19.510596+00	\N	2026-04-05 01:52:19.510596+00	11111111-1111-1111-1111-111111111111
323	FAC-20260404-5640	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 02:10:29.589686+00	\N	\N	2026-04-05 02:10:29.589686+00	\N	2026-04-05 02:10:29.589686+00	11111111-1111-1111-1111-111111111111
324	FAC-20260404-6264	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 02:11:40.277292+00	\N	\N	2026-04-05 02:11:40.277292+00	\N	2026-04-05 02:11:40.277292+00	11111111-1111-1111-1111-111111111111
325	FAC-20260404-8616	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 02:12:22.532059+00	\N	\N	2026-04-05 02:12:22.532059+00	\N	2026-04-05 02:12:22.532059+00	11111111-1111-1111-1111-111111111111
326	FAC-20260404-6417	\N	3	43	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 02:20:50.355349+00	12	121	2026-04-05 02:20:50.355349+00	\N	2026-04-05 02:20:50.355349+00	11111111-1111-1111-1111-111111111111
327	FAC-20260404-0375	\N	3	43	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 02:23:44.288018+00	5	124	2026-04-05 02:23:44.288018+00	\N	2026-04-05 02:23:44.288018+00	11111111-1111-1111-1111-111111111111
328	FAC-20260404-0662	\N	3	43	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 02:40:44.549591+00	\N	\N	2026-04-05 02:40:44.549591+00	\N	2026-04-05 02:40:44.549591+00	11111111-1111-1111-1111-111111111111
329	FAC-20260404-1000	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 02:47:34.881159+00	5	127	2026-04-05 02:47:34.881159+00	\N	2026-04-05 02:47:34.881159+00	11111111-1111-1111-1111-111111111111
330	FAC-20260404-7070	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 02:50:00.99121+00	\N	\N	2026-04-05 02:50:00.99121+00	\N	2026-04-05 02:50:00.99121+00	11111111-1111-1111-1111-111111111111
331	FAC-20260404-3183	\N	3	43	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 02:56:17.067758+00	\N	\N	2026-04-05 02:56:17.067758+00	\N	2026-04-05 02:56:17.067758+00	11111111-1111-1111-1111-111111111111
332	FAC-20260404-6361	\N	3	43	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 02:56:40.230944+00	\N	\N	2026-04-05 02:56:40.230944+00	\N	2026-04-05 02:56:40.230944+00	11111111-1111-1111-1111-111111111111
333	FAC-20260404-2938	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:03:36.831208+00	\N	\N	2026-04-05 03:03:36.831208+00	\N	2026-04-05 03:03:36.831208+00	11111111-1111-1111-1111-111111111111
334	FAC-20260404-6073	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:09:39.938303+00	\N	\N	2026-04-05 03:09:39.938303+00	\N	2026-04-05 03:09:39.938303+00	11111111-1111-1111-1111-111111111111
335	FAC-20260404-7516	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:18:21.386278+00	\N	\N	2026-04-05 03:18:21.386278+00	\N	2026-04-05 03:18:21.386278+00	11111111-1111-1111-1111-111111111111
336	FAC-20260404-0201	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:24:34.10474+00	\N	\N	2026-04-05 03:24:34.10474+00	\N	2026-04-05 03:24:34.10474+00	11111111-1111-1111-1111-111111111111
337	FAC-20260404-9229	\N	3	43	2450	0	0	2450	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:25:13.076388+00	3	117	2026-04-05 03:25:13.076388+00	\N	2026-04-05 03:25:13.076388+00	11111111-1111-1111-1111-111111111111
338	FAC-20260404-9054	\N	3	43	1400	0	0	1400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:32:42.913625+00	13	125	2026-04-05 03:32:42.913625+00	\N	2026-04-05 03:32:42.913625+00	11111111-1111-1111-1111-111111111111
339	FAC-20260404-6097	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:37:19.955303+00	\N	\N	2026-04-05 03:37:19.955303+00	\N	2026-04-05 03:37:19.955303+00	11111111-1111-1111-1111-111111111111
340	FAC-20260404-7366	\N	3	43	450	0	0	450	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:39:31.19772+00	5	128	2026-04-05 03:39:31.19772+00	\N	2026-04-05 03:39:31.19772+00	11111111-1111-1111-1111-111111111111
341	FAC-20260404-3503	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:40:17.350034+00	\N	\N	2026-04-05 03:40:17.350034+00	\N	2026-04-05 03:40:17.350034+00	11111111-1111-1111-1111-111111111111
342	FAC-20260404-3483	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:44:17.523806+00	\N	\N	2026-04-05 03:44:17.523806+00	\N	2026-04-05 03:44:17.523806+00	11111111-1111-1111-1111-111111111111
343	FAC-20260404-3861	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:44:37.716282+00	\N	\N	2026-04-05 03:44:37.716282+00	\N	2026-04-05 03:44:37.716282+00	11111111-1111-1111-1111-111111111111
344	FAC-20260404-5901	\N	3	43	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:52:49.758536+00	12	129	2026-04-05 03:52:49.758536+00	\N	2026-04-05 03:52:49.758536+00	11111111-1111-1111-1111-111111111111
345	FAC-20260404-4101	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:53:28.14468+00	\N	\N	2026-04-05 03:53:28.14468+00	\N	2026-04-05 03:53:28.14468+00	11111111-1111-1111-1111-111111111111
346	FAC-20260404-7921	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:54:31.758113+00	\N	\N	2026-04-05 03:54:31.758113+00	\N	2026-04-05 03:54:31.758113+00	11111111-1111-1111-1111-111111111111
347	FAC-20260404-8906	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:55:52.741068+00	\N	\N	2026-04-05 03:55:52.741068+00	\N	2026-04-05 03:55:52.741068+00	11111111-1111-1111-1111-111111111111
348	FAC-20260404-1270	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 03:59:05.079557+00	3	131	2026-04-05 03:59:05.079557+00	\N	2026-04-05 03:59:05.079557+00	11111111-1111-1111-1111-111111111111
349	FAC-20260404-9695	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 04:10:03.501923+00	3	132	2026-04-05 04:10:03.501923+00	\N	2026-04-05 04:10:03.501923+00	11111111-1111-1111-1111-111111111111
350	FAC-20260404-4768	\N	3	43	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 04:10:38.595061+00	\N	\N	2026-04-05 04:10:38.595061+00	\N	2026-04-05 04:10:38.595061+00	11111111-1111-1111-1111-111111111111
351	FAC-20260404-2915	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 04:17:46.726456+00	\N	\N	2026-04-05 04:17:46.726456+00	\N	2026-04-05 04:17:46.726456+00	11111111-1111-1111-1111-111111111111
352	FAC-20260404-6410	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 04:20:00.275644+00	\N	\N	2026-04-05 04:20:00.275644+00	\N	2026-04-05 04:20:00.275644+00	11111111-1111-1111-1111-111111111111
353	FAC-20260404-4254	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 04:27:48.118455+00	\N	\N	2026-04-05 04:27:48.118455+00	\N	2026-04-05 04:27:48.118455+00	11111111-1111-1111-1111-111111111111
354	FAC-20260404-3794	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 04:31:37.576604+00	13	133	2026-04-05 04:31:37.576604+00	\N	2026-04-05 04:31:37.576604+00	11111111-1111-1111-1111-111111111111
355	FAC-20260404-1117	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 04:35:34.89581+00	3	134	2026-04-05 04:35:34.89581+00	\N	2026-04-05 04:35:34.89581+00	11111111-1111-1111-1111-111111111111
356	FAC-20260404-8944	\N	3	43	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 04:39:42.720917+00	5	130	2026-04-05 04:39:42.720917+00	\N	2026-04-05 04:39:42.720917+00	11111111-1111-1111-1111-111111111111
357	FAC-20260404-6641	\N	3	43	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 04:48:10.412575+00	3	135	2026-04-05 04:48:10.412575+00	\N	2026-04-05 04:48:10.412575+00	11111111-1111-1111-1111-111111111111
358	FAC-20260404-4043	\N	3	43	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 05:11:27.797041+00	2	126	2026-04-05 05:11:27.797041+00	\N	2026-04-05 05:11:27.797041+00	11111111-1111-1111-1111-111111111111
359	FAC-20260404-6064	\N	3	43	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 05:32:00.073228+00	\N	\N	2026-04-05 05:32:00.073228+00	\N	2026-04-05 05:32:00.073228+00	11111111-1111-1111-1111-111111111111
360	FAC-20260404-1637	\N	3	43	2000	0	0	2000	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 05:42:25.360374+00	4	119	2026-04-05 05:42:25.360374+00	\N	2026-04-05 05:42:25.360374+00	11111111-1111-1111-1111-111111111111
361	FAC-20260404-8933	\N	3	43	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 05:43:52.647322+00	3	136	2026-04-05 05:43:52.647322+00	\N	2026-04-05 05:43:52.647322+00	11111111-1111-1111-1111-111111111111
362	FAC-20260405-4564	\N	3	44	1200	0	0	1200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-05 23:45:19.817739+00	3	137	2026-04-05 23:45:19.817739+00	\N	2026-04-05 23:45:19.817739+00	11111111-1111-1111-1111-111111111111
363	FAC-20260405-3145	\N	3	44	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-06 00:45:18.621907+00	\N	\N	2026-04-06 00:45:18.621907+00	\N	2026-04-06 00:45:18.621907+00	11111111-1111-1111-1111-111111111111
364	FAC-20260405-8789	\N	3	44	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-06 00:49:14.069047+00	\N	\N	2026-04-06 00:49:14.069047+00	\N	2026-04-06 00:49:14.069047+00	11111111-1111-1111-1111-111111111111
365	FAC-20260405-6802	\N	3	44	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-06 01:02:11.997675+00	\N	\N	2026-04-06 01:02:11.997675+00	\N	2026-04-06 01:02:11.997675+00	11111111-1111-1111-1111-111111111111
366	FAC-20260405-3398	\N	3	44	15	0	0	15	efectivo	contado	completada	\N	\N	\N	\N	2026-04-06 01:28:28.758209+00	\N	\N	2026-04-06 01:28:28.758209+00	\N	2026-04-06 01:28:28.758209+00	11111111-1111-1111-1111-111111111111
367	FAC-20260405-3290	\N	3	44	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-06 01:59:08.443993+00	4	139	2026-04-06 01:59:08.443993+00	\N	2026-04-06 01:59:08.443993+00	11111111-1111-1111-1111-111111111111
368	FAC-20260405-7269	\N	3	44	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-06 02:13:12.653205+00	\N	\N	2026-04-06 02:13:12.653205+00	\N	2026-04-06 02:13:12.653205+00	11111111-1111-1111-1111-111111111111
369	FAC-20260405-1890	\N	3	44	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-06 02:43:57.015935+00	3	138	2026-04-06 02:43:57.015935+00	\N	2026-04-06 02:43:57.015935+00	11111111-1111-1111-1111-111111111111
370	FAC-20260406-1741	\N	3	45	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-06 21:20:17.398348+00	\N	\N	2026-04-06 21:20:17.398348+00	\N	2026-04-06 21:20:17.398348+00	11111111-1111-1111-1111-111111111111
371	FAC-20260406-1260	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-06 23:42:26.978581+00	\N	\N	2026-04-06 23:42:26.978581+00	\N	2026-04-06 23:42:26.978581+00	11111111-1111-1111-1111-111111111111
372	FAC-20260406-5798	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-06 23:42:41.21738+00	\N	\N	2026-04-06 23:42:41.21738+00	\N	2026-04-06 23:42:41.21738+00	11111111-1111-1111-1111-111111111111
373	FAC-20260406-5653	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 00:00:21.261606+00	\N	\N	2026-04-07 00:00:21.261606+00	\N	2026-04-07 00:00:21.261606+00	11111111-1111-1111-1111-111111111111
374	FAC-20260406-0788	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 00:09:26.398257+00	\N	\N	2026-04-07 00:09:26.398257+00	\N	2026-04-07 00:09:26.398257+00	11111111-1111-1111-1111-111111111111
375	FAC-20260406-4948	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 00:16:40.503336+00	\N	\N	2026-04-07 00:16:40.503336+00	\N	2026-04-07 00:16:40.503336+00	11111111-1111-1111-1111-111111111111
376	FAC-20260406-4585	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 00:29:30.20406+00	\N	\N	2026-04-07 00:29:30.20406+00	\N	2026-04-07 00:29:30.20406+00	11111111-1111-1111-1111-111111111111
377	FAC-20260406-1042	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 00:39:56.55868+00	\N	\N	2026-04-07 00:39:56.55868+00	\N	2026-04-07 00:39:56.55868+00	11111111-1111-1111-1111-111111111111
378	FAC-20260406-2968	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 01:12:08.663825+00	\N	\N	2026-04-07 01:12:08.663825+00	\N	2026-04-07 01:12:08.663825+00	11111111-1111-1111-1111-111111111111
379	FAC-20260406-8569	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 01:35:04.235082+00	\N	\N	2026-04-07 01:35:04.235082+00	\N	2026-04-07 01:35:04.235082+00	11111111-1111-1111-1111-111111111111
380	FAC-20260406-6994	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 01:48:22.51368+00	\N	\N	2026-04-07 01:48:22.51368+00	\N	2026-04-07 01:48:22.51368+00	11111111-1111-1111-1111-111111111111
381	FAC-20260406-0285	\N	3	45	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 02:15:15.829778+00	\N	\N	2026-04-07 02:15:15.829778+00	\N	2026-04-07 02:15:15.829778+00	11111111-1111-1111-1111-111111111111
382	FAC-20260406-8021	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 02:34:03.511678+00	\N	\N	2026-04-07 02:34:03.511678+00	\N	2026-04-07 02:34:03.511678+00	11111111-1111-1111-1111-111111111111
383	FAC-20260406-9829	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 02:34:05.131183+00	\N	\N	2026-04-07 02:34:05.131183+00	\N	2026-04-07 02:34:05.131183+00	11111111-1111-1111-1111-111111111111
384	FAC-20260406-5917	\N	3	45	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 03:08:21.206879+00	3	140	2026-04-07 03:08:21.206879+00	\N	2026-04-07 03:08:21.206879+00	11111111-1111-1111-1111-111111111111
385	FAC-20260406-3830	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 03:08:39.128069+00	4	141	2026-04-07 03:08:39.128069+00	\N	2026-04-07 03:08:39.128069+00	11111111-1111-1111-1111-111111111111
386	FAC-20260406-0791	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 03:09:06.072939+00	\N	\N	2026-04-07 03:09:06.072939+00	\N	2026-04-07 03:09:06.072939+00	11111111-1111-1111-1111-111111111111
387	FAC-20260406-9434	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 03:22:05.047377+00	\N	\N	2026-04-07 03:22:05.047377+00	\N	2026-04-07 03:22:05.047377+00	11111111-1111-1111-1111-111111111111
388	FAC-20260406-9241	\N	3	45	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-07 03:34:44.518933+00	\N	\N	2026-04-07 03:34:44.518933+00	\N	2026-04-07 03:34:44.518933+00	11111111-1111-1111-1111-111111111111
389	FAC-20260408-8709	\N	3	46	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 00:32:15.376705+00	\N	\N	2026-04-09 00:32:15.376705+00	\N	2026-04-09 00:32:15.376705+00	11111111-1111-1111-1111-111111111111
390	FAC-20260408-2995	\N	3	46	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 00:43:29.369175+00	\N	\N	2026-04-09 00:43:29.369175+00	\N	2026-04-09 00:43:29.369175+00	11111111-1111-1111-1111-111111111111
391	FAC-20260408-7547	\N	3	46	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 00:44:24.152759+00	\N	\N	2026-04-09 00:44:24.152759+00	\N	2026-04-09 00:44:24.152759+00	11111111-1111-1111-1111-111111111111
392	FAC-20260408-9405	\N	3	46	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 00:57:16.004059+00	\N	\N	2026-04-09 00:57:16.004059+00	\N	2026-04-09 00:57:16.004059+00	11111111-1111-1111-1111-111111111111
393	FAC-20260408-0910	\N	3	46	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 00:57:47.216876+00	\N	\N	2026-04-09 00:57:47.216876+00	\N	2026-04-09 00:57:47.216876+00	11111111-1111-1111-1111-111111111111
394	FAC-20260408-8978	\N	3	46	1400	0	0	1400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 01:15:55.591481+00	\N	\N	2026-04-09 01:15:55.591481+00	\N	2026-04-09 01:15:55.591481+00	11111111-1111-1111-1111-111111111111
395	FAC-20260408-7191	\N	3	46	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 01:17:43.576445+00	\N	\N	2026-04-09 01:17:43.576445+00	\N	2026-04-09 01:17:43.576445+00	11111111-1111-1111-1111-111111111111
396	FAC-20260408-3174	\N	3	46	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 01:24:09.619457+00	\N	\N	2026-04-09 01:24:09.619457+00	\N	2026-04-09 01:24:09.619457+00	11111111-1111-1111-1111-111111111111
397	FAC-20260408-3163	\N	3	46	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 01:50:39.741229+00	\N	\N	2026-04-09 01:50:39.741229+00	\N	2026-04-09 01:50:39.741229+00	11111111-1111-1111-1111-111111111111
398	FAC-20260408-6776	\N	3	46	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 02:17:43.246346+00	\N	\N	2026-04-09 02:17:43.246346+00	\N	2026-04-09 02:17:43.246346+00	11111111-1111-1111-1111-111111111111
399	FAC-20260408-5658	\N	3	46	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 02:40:02.182734+00	\N	\N	2026-04-09 02:40:02.182734+00	\N	2026-04-09 02:40:02.182734+00	11111111-1111-1111-1111-111111111111
400	FAC-20260408-2804	\N	3	46	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 02:51:49.260995+00	\N	\N	2026-04-09 02:51:49.260995+00	\N	2026-04-09 02:51:49.260995+00	11111111-1111-1111-1111-111111111111
401	FAC-20260408-7375	\N	3	46	1400	0	0	1400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 03:30:23.739128+00	\N	\N	2026-04-09 03:30:23.739128+00	\N	2026-04-09 03:30:23.739128+00	11111111-1111-1111-1111-111111111111
402	FAC-20260408-4521	\N	3	46	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 03:34:10.856056+00	\N	\N	2026-04-09 03:34:10.856056+00	\N	2026-04-09 03:34:10.856056+00	11111111-1111-1111-1111-111111111111
403	FAC-20260409-1992	\N	3	47	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 22:08:29.858007+00	\N	\N	2026-04-09 22:08:29.858007+00	\N	2026-04-09 22:08:29.858007+00	11111111-1111-1111-1111-111111111111
404	FAC-20260409-3692	\N	3	47	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 23:13:01.339842+00	4	143	2026-04-09 23:13:01.339842+00	\N	2026-04-09 23:13:01.339842+00	11111111-1111-1111-1111-111111111111
405	FAC-20260409-2763	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 23:35:50.352993+00	\N	\N	2026-04-09 23:35:50.352993+00	\N	2026-04-09 23:35:50.352993+00	11111111-1111-1111-1111-111111111111
406	FAC-20260409-8314	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-09 23:58:45.916528+00	\N	\N	2026-04-09 23:58:45.916528+00	\N	2026-04-09 23:58:45.916528+00	11111111-1111-1111-1111-111111111111
407	FAC-20260409-9177	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 00:35:17.064164+00	\N	\N	2026-04-10 00:35:17.064164+00	\N	2026-04-10 00:35:17.064164+00	11111111-1111-1111-1111-111111111111
408	FAC-20260409-1875	\N	3	47	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 00:38:19.475276+00	\N	\N	2026-04-10 00:38:19.475276+00	\N	2026-04-10 00:38:19.475276+00	11111111-1111-1111-1111-111111111111
409	FAC-20260409-9354	\N	3	47	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 00:46:46.900788+00	4	144	2026-04-10 00:46:46.900788+00	\N	2026-04-10 00:46:46.900788+00	11111111-1111-1111-1111-111111111111
410	FAC-20260409-9423	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 01:01:07.565193+00	\N	\N	2026-04-10 01:01:07.565193+00	\N	2026-04-10 01:01:07.565193+00	11111111-1111-1111-1111-111111111111
411	FAC-20260409-4801	\N	3	47	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 01:06:12.370654+00	\N	\N	2026-04-10 01:06:12.370654+00	\N	2026-04-10 01:06:12.370654+00	11111111-1111-1111-1111-111111111111
412	FAC-20260409-3717	\N	3	47	1000	0	0	1000	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 01:26:01.281034+00	3	145	2026-04-10 01:26:01.281034+00	\N	2026-04-10 01:26:01.281034+00	11111111-1111-1111-1111-111111111111
413	FAC-20260409-9564	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 01:29:17.076273+00	5	147	2026-04-10 01:29:17.076273+00	\N	2026-04-10 01:29:17.076273+00	11111111-1111-1111-1111-111111111111
414	FAC-20260409-0966	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 01:39:18.496669+00	\N	\N	2026-04-10 01:39:18.496669+00	\N	2026-04-10 01:39:18.496669+00	11111111-1111-1111-1111-111111111111
415	FAC-20260409-7786	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 01:51:45.311256+00	\N	\N	2026-04-10 01:51:45.311256+00	\N	2026-04-10 01:51:45.311256+00	11111111-1111-1111-1111-111111111111
416	FAC-20260409-9639	\N	3	47	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 02:00:07.197753+00	3	148	2026-04-10 02:00:07.197753+00	\N	2026-04-10 02:00:07.197753+00	11111111-1111-1111-1111-111111111111
417	FAC-20260409-9156	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 02:17:16.931376+00	\N	\N	2026-04-10 02:17:16.931376+00	\N	2026-04-10 02:17:16.931376+00	11111111-1111-1111-1111-111111111111
418	FAC-20260409-0295	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 02:31:07.787356+00	\N	\N	2026-04-10 02:31:07.787356+00	\N	2026-04-10 02:31:07.787356+00	11111111-1111-1111-1111-111111111111
419	FAC-20260409-0474	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 02:45:48.206955+00	\N	\N	2026-04-10 02:45:48.206955+00	\N	2026-04-10 02:45:48.206955+00	11111111-1111-1111-1111-111111111111
420	FAC-20260409-0950	\N	3	47	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 02:53:58.461043+00	\N	\N	2026-04-10 02:53:58.461043+00	\N	2026-04-10 02:53:58.461043+00	11111111-1111-1111-1111-111111111111
421	FAC-20260410-7414	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 21:29:16.940476+00	\N	\N	2026-04-10 21:29:16.940476+00	\N	2026-04-10 21:29:16.940476+00	11111111-1111-1111-1111-111111111111
422	FAC-20260410-4266	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 22:20:33.488949+00	3	149	2026-04-10 22:20:33.488949+00	\N	2026-04-10 22:20:33.488949+00	11111111-1111-1111-1111-111111111111
423	FAC-20260410-7712	\N	3	48	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-10 22:47:56.925285+00	4	150	2026-04-10 22:47:56.925285+00	\N	2026-04-10 22:47:56.925285+00	11111111-1111-1111-1111-111111111111
424	FAC-20260410-0164	\N	3	48	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 00:16:09.597153+00	\N	\N	2026-04-11 00:16:09.597153+00	\N	2026-04-11 00:16:09.597153+00	11111111-1111-1111-1111-111111111111
425	FAC-20260410-8757	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 00:20:58.012862+00	\N	\N	2026-04-11 00:20:58.012862+00	\N	2026-04-11 00:20:58.012862+00	11111111-1111-1111-1111-111111111111
426	FAC-20260410-3160	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 00:41:12.548716+00	\N	\N	2026-04-11 00:41:12.548716+00	\N	2026-04-11 00:41:12.548716+00	11111111-1111-1111-1111-111111111111
427	FAC-20260410-7907	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 00:44:57.299661+00	\N	\N	2026-04-11 00:44:57.299661+00	\N	2026-04-11 00:44:57.299661+00	11111111-1111-1111-1111-111111111111
428	FAC-20260410-3083	\N	3	48	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 00:52:32.374888+00	\N	\N	2026-04-11 00:52:32.374888+00	\N	2026-04-11 00:52:32.374888+00	11111111-1111-1111-1111-111111111111
429	FAC-20260410-1833	\N	3	48	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 00:55:21.049392+00	\N	\N	2026-04-11 00:55:21.049392+00	\N	2026-04-11 00:55:21.049392+00	11111111-1111-1111-1111-111111111111
430	FAC-20260410-6276	\N	3	48	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:09:45.400736+00	\N	\N	2026-04-11 01:09:45.400736+00	\N	2026-04-11 01:09:45.400736+00	11111111-1111-1111-1111-111111111111
431	FAC-20260410-9807	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:14:08.975441+00	\N	\N	2026-04-11 01:14:08.975441+00	\N	2026-04-11 01:14:08.975441+00	11111111-1111-1111-1111-111111111111
432	FAC-20260410-4915	\N	3	48	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:20:34.211032+00	\N	\N	2026-04-11 01:20:34.211032+00	\N	2026-04-11 01:20:34.211032+00	11111111-1111-1111-1111-111111111111
433	FAC-20260410-2770	\N	3	48	225	0	0	225	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:22:01.910176+00	\N	\N	2026-04-11 01:22:01.910176+00	\N	2026-04-11 01:22:01.910176+00	11111111-1111-1111-1111-111111111111
434	FAC-20260410-0050	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:22:49.181549+00	\N	\N	2026-04-11 01:22:49.181549+00	\N	2026-04-11 01:22:49.181549+00	11111111-1111-1111-1111-111111111111
435	FAC-20260410-3462	\N	3	48	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:23:42.612353+00	\N	\N	2026-04-11 01:23:42.612353+00	\N	2026-04-11 01:23:42.612353+00	11111111-1111-1111-1111-111111111111
436	FAC-20260410-2710	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:31:12.092833+00	\N	\N	2026-04-11 01:31:12.092833+00	\N	2026-04-11 01:31:12.092833+00	11111111-1111-1111-1111-111111111111
437	FAC-20260410-9512	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:32:18.637458+00	3	151	2026-04-11 01:32:18.637458+00	\N	2026-04-11 01:32:18.637458+00	11111111-1111-1111-1111-111111111111
438	FAC-20260410-4703	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:42:33.826606+00	\N	\N	2026-04-11 01:42:33.826606+00	\N	2026-04-11 01:42:33.826606+00	11111111-1111-1111-1111-111111111111
439	FAC-20260410-2794	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:56:02.193644+00	\N	\N	2026-04-11 01:56:02.193644+00	\N	2026-04-11 01:56:02.193644+00	11111111-1111-1111-1111-111111111111
440	FAC-20260410-3832	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 01:58:42.969387+00	\N	\N	2026-04-11 01:58:42.969387+00	\N	2026-04-11 01:58:42.969387+00	11111111-1111-1111-1111-111111111111
441	FAC-20260410-0542	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 02:21:39.660954+00	3	153	2026-04-11 02:21:39.660954+00	\N	2026-04-11 02:21:39.660954+00	11111111-1111-1111-1111-111111111111
442	FAC-20260410-8815	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 02:33:18.094732+00	\N	\N	2026-04-11 02:33:18.094732+00	\N	2026-04-11 02:33:18.094732+00	11111111-1111-1111-1111-111111111111
443	FAC-20260410-7760	\N	3	48	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 02:38:16.854374+00	\N	\N	2026-04-11 02:38:16.854374+00	\N	2026-04-11 02:38:16.854374+00	11111111-1111-1111-1111-111111111111
444	FAC-20260410-6602	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 03:01:05.936487+00	\N	\N	2026-04-11 03:01:05.936487+00	\N	2026-04-11 03:01:05.936487+00	11111111-1111-1111-1111-111111111111
445	FAC-20260410-0350	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 03:11:19.566214+00	\N	\N	2026-04-11 03:11:19.566214+00	\N	2026-04-11 03:11:19.566214+00	11111111-1111-1111-1111-111111111111
446	FAC-20260410-0739	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 03:11:19.821754+00	\N	\N	2026-04-11 03:11:19.821754+00	\N	2026-04-11 03:11:19.821754+00	11111111-1111-1111-1111-111111111111
447	FAC-20260410-0697	\N	3	48	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 03:53:19.772782+00	\N	\N	2026-04-11 03:53:19.772782+00	\N	2026-04-11 03:53:19.772782+00	11111111-1111-1111-1111-111111111111
448	FAC-20260410-1022	\N	3	48	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 03:54:30.059424+00	\N	\N	2026-04-11 03:54:30.059424+00	\N	2026-04-11 03:54:30.059424+00	11111111-1111-1111-1111-111111111111
449	FAC-20260411-8837	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 20:33:49.252935+00	\N	\N	2026-04-11 20:33:49.252935+00	\N	2026-04-11 20:33:49.252935+00	11111111-1111-1111-1111-111111111111
450	FAC-20260411-4060	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 20:49:04.264952+00	\N	\N	2026-04-11 20:49:04.264952+00	\N	2026-04-11 20:49:04.264952+00	11111111-1111-1111-1111-111111111111
451	FAC-20260411-6724	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 20:56:17.042076+00	\N	\N	2026-04-11 20:56:17.042076+00	\N	2026-04-11 20:56:17.042076+00	11111111-1111-1111-1111-111111111111
452	FAC-20260411-7184	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:00:07.400282+00	\N	\N	2026-04-11 21:00:07.400282+00	\N	2026-04-11 21:00:07.400282+00	11111111-1111-1111-1111-111111111111
453	FAC-20260411-6014	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:03:36.230899+00	\N	\N	2026-04-11 21:03:36.230899+00	\N	2026-04-11 21:03:36.230899+00	11111111-1111-1111-1111-111111111111
454	FAC-20260411-1627	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:05:51.927864+00	\N	\N	2026-04-11 21:05:51.927864+00	\N	2026-04-11 21:05:51.927864+00	11111111-1111-1111-1111-111111111111
455	FAC-20260411-2552	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:09:02.793863+00	\N	\N	2026-04-11 21:09:02.793863+00	\N	2026-04-11 21:09:02.793863+00	11111111-1111-1111-1111-111111111111
456	FAC-20260411-4245	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:09:04.445756+00	\N	\N	2026-04-11 21:09:04.445756+00	\N	2026-04-11 21:09:04.445756+00	11111111-1111-1111-1111-111111111111
457	FAC-20260411-8319	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:10:18.524543+00	\N	\N	2026-04-11 21:10:18.524543+00	\N	2026-04-11 21:10:18.524543+00	11111111-1111-1111-1111-111111111111
458	FAC-20260411-5092	\N	3	49	30	0	0	30	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:12:45.27974+00	\N	\N	2026-04-11 21:12:45.27974+00	\N	2026-04-11 21:12:45.27974+00	11111111-1111-1111-1111-111111111111
459	FAC-20260411-7185	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:14:27.380454+00	\N	\N	2026-04-11 21:14:27.380454+00	\N	2026-04-11 21:14:27.380454+00	11111111-1111-1111-1111-111111111111
460	FAC-20260411-0732	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:21:01.013172+00	\N	\N	2026-04-11 21:21:01.013172+00	\N	2026-04-11 21:21:01.013172+00	11111111-1111-1111-1111-111111111111
461	FAC-20260411-8272	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:31:18.49968+00	\N	\N	2026-04-11 21:31:18.49968+00	\N	2026-04-11 21:31:18.49968+00	11111111-1111-1111-1111-111111111111
462	FAC-20260411-7215	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:32:27.397437+00	\N	\N	2026-04-11 21:32:27.397437+00	\N	2026-04-11 21:32:27.397437+00	11111111-1111-1111-1111-111111111111
463	FAC-20260411-6630	\N	3	49	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:40:56.842805+00	\N	\N	2026-04-11 21:40:56.842805+00	\N	2026-04-11 21:40:56.842805+00	11111111-1111-1111-1111-111111111111
464	FAC-20260411-4356	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:41:24.589575+00	\N	\N	2026-04-11 21:41:24.589575+00	\N	2026-04-11 21:41:24.589575+00	11111111-1111-1111-1111-111111111111
465	FAC-20260411-6371	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:42:46.721817+00	\N	\N	2026-04-11 21:42:46.721817+00	\N	2026-04-11 21:42:46.721817+00	11111111-1111-1111-1111-111111111111
466	FAC-20260411-4124	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:46:14.295966+00	\N	\N	2026-04-11 21:46:14.295966+00	\N	2026-04-11 21:46:14.295966+00	11111111-1111-1111-1111-111111111111
467	FAC-20260411-6351	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:47:26.522004+00	\N	\N	2026-04-11 21:47:26.522004+00	\N	2026-04-11 21:47:26.522004+00	11111111-1111-1111-1111-111111111111
468	FAC-20260411-7604	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:57:47.765165+00	\N	\N	2026-04-11 21:57:47.765165+00	\N	2026-04-11 21:57:47.765165+00	11111111-1111-1111-1111-111111111111
469	FAC-20260411-3898	\N	3	49	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 21:59:04.042432+00	4	156	2026-04-11 21:59:04.042432+00	\N	2026-04-11 21:59:04.042432+00	11111111-1111-1111-1111-111111111111
470	FAC-20260411-6062	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 22:02:16.204065+00	3	155	2026-04-11 22:02:16.204065+00	\N	2026-04-11 22:02:16.204065+00	11111111-1111-1111-1111-111111111111
471	FAC-20260411-9147	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 22:19:29.312721+00	\N	\N	2026-04-11 22:19:29.312721+00	\N	2026-04-11 22:19:29.312721+00	11111111-1111-1111-1111-111111111111
472	FAC-20260411-0755	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 22:38:51.116589+00	\N	\N	2026-04-11 22:38:51.116589+00	\N	2026-04-11 22:38:51.116589+00	11111111-1111-1111-1111-111111111111
473	FAC-20260411-3205	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 23:00:33.331739+00	3	159	2026-04-11 23:00:33.331739+00	\N	2026-04-11 23:00:33.331739+00	11111111-1111-1111-1111-111111111111
474	FAC-20260411-4423	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 23:15:04.72606+00	\N	\N	2026-04-11 23:15:04.72606+00	\N	2026-04-11 23:15:04.72606+00	11111111-1111-1111-1111-111111111111
475	FAC-20260411-5838	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 23:20:16.078538+00	\N	\N	2026-04-11 23:20:16.078538+00	\N	2026-04-11 23:20:16.078538+00	11111111-1111-1111-1111-111111111111
476	FAC-20260411-7288	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 23:22:57.399436+00	\N	\N	2026-04-11 23:22:57.399436+00	\N	2026-04-11 23:22:57.399436+00	11111111-1111-1111-1111-111111111111
477	FAC-20260411-3752	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 23:35:34.057288+00	\N	\N	2026-04-11 23:35:34.057288+00	\N	2026-04-11 23:35:34.057288+00	11111111-1111-1111-1111-111111111111
478	FAC-20260411-8155	\N	3	49	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 23:40:38.216121+00	3	161	2026-04-11 23:40:38.216121+00	\N	2026-04-11 23:40:38.216121+00	11111111-1111-1111-1111-111111111111
479	FAC-20260411-9700	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 23:42:19.758614+00	3	163	2026-04-11 23:42:19.758614+00	\N	2026-04-11 23:42:19.758614+00	11111111-1111-1111-1111-111111111111
480	FAC-20260411-2577	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 23:42:42.635826+00	\N	\N	2026-04-11 23:42:42.635826+00	\N	2026-04-11 23:42:42.635826+00	11111111-1111-1111-1111-111111111111
481	FAC-20260411-9901	\N	3	49	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 23:57:29.958526+00	\N	\N	2026-04-11 23:57:29.958526+00	\N	2026-04-11 23:57:29.958526+00	11111111-1111-1111-1111-111111111111
482	FAC-20260411-8740	\N	3	49	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-11 23:58:48.785899+00	4	158	2026-04-11 23:58:48.785899+00	\N	2026-04-11 23:58:48.785899+00	11111111-1111-1111-1111-111111111111
483	FAC-20260411-7264	\N	3	49	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 00:13:17.325648+00	13	162	2026-04-12 00:13:17.325648+00	\N	2026-04-12 00:13:17.325648+00	11111111-1111-1111-1111-111111111111
484	FAC-20260411-7749	\N	3	49	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 00:15:08.147531+00	\N	\N	2026-04-12 00:15:08.147531+00	\N	2026-04-12 00:15:08.147531+00	11111111-1111-1111-1111-111111111111
485	FAC-20260411-4929	\N	3	49	1900	0	0	1900	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 00:43:14.943132+00	5	157	2026-04-12 00:43:14.943132+00	\N	2026-04-12 00:43:14.943132+00	11111111-1111-1111-1111-111111111111
486	FAC-20260412-9481	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 20:27:40.104984+00	\N	\N	2026-04-12 20:27:40.104984+00	\N	2026-04-12 20:27:40.104984+00	11111111-1111-1111-1111-111111111111
487	FAC-20260412-5756	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 20:38:36.350039+00	\N	\N	2026-04-12 20:38:36.350039+00	\N	2026-04-12 20:38:36.350039+00	11111111-1111-1111-1111-111111111111
488	FAC-20260412-5240	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 20:41:15.830829+00	\N	\N	2026-04-12 20:41:15.830829+00	\N	2026-04-12 20:41:15.830829+00	11111111-1111-1111-1111-111111111111
489	FAC-20260412-8011	\N	3	50	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 20:57:48.623401+00	4	169	2026-04-12 20:57:48.623401+00	\N	2026-04-12 20:57:48.623401+00	11111111-1111-1111-1111-111111111111
490	FAC-20260412-3833	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 21:17:34.435306+00	\N	\N	2026-04-12 21:17:34.435306+00	\N	2026-04-12 21:17:34.435306+00	11111111-1111-1111-1111-111111111111
491	FAC-20260412-6052	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 21:22:46.66269+00	\N	\N	2026-04-12 21:22:46.66269+00	\N	2026-04-12 21:22:46.66269+00	11111111-1111-1111-1111-111111111111
492	FAC-20260412-9731	\N	3	50	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 21:27:00.284336+00	3	168	2026-04-12 21:27:00.284336+00	\N	2026-04-12 21:27:00.284336+00	11111111-1111-1111-1111-111111111111
493	FAC-20260412-0522	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 21:29:41.111076+00	5	166	2026-04-12 21:29:41.111076+00	\N	2026-04-12 21:29:41.111076+00	11111111-1111-1111-1111-111111111111
494	FAC-20260412-7751	\N	3	50	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 21:30:38.472478+00	\N	\N	2026-04-12 21:30:38.472478+00	\N	2026-04-12 21:30:38.472478+00	11111111-1111-1111-1111-111111111111
495	FAC-20260412-7325	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 21:35:48.132591+00	\N	\N	2026-04-12 21:35:48.132591+00	\N	2026-04-12 21:35:48.132591+00	11111111-1111-1111-1111-111111111111
496	FAC-20260412-3762	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 21:39:04.31269+00	4	171	2026-04-12 21:39:04.31269+00	\N	2026-04-12 21:39:04.31269+00	11111111-1111-1111-1111-111111111111
497	FAC-20260412-4404	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:01:45.135775+00	\N	\N	2026-04-12 22:01:45.135775+00	\N	2026-04-12 22:01:45.135775+00	11111111-1111-1111-1111-111111111111
498	FAC-20260412-5157	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:01:45.722228+00	\N	\N	2026-04-12 22:01:45.722228+00	\N	2026-04-12 22:01:45.722228+00	11111111-1111-1111-1111-111111111111
499	FAC-20260412-8394	\N	3	50	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:08:38.945554+00	3	173	2026-04-12 22:08:38.945554+00	\N	2026-04-12 22:08:38.945554+00	11111111-1111-1111-1111-111111111111
500	FAC-20260412-5855	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:14:06.354785+00	\N	\N	2026-04-12 22:14:06.354785+00	\N	2026-04-12 22:14:06.354785+00	11111111-1111-1111-1111-111111111111
501	FAC-20260412-3655	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:19:24.177604+00	\N	\N	2026-04-12 22:19:24.177604+00	\N	2026-04-12 22:19:24.177604+00	11111111-1111-1111-1111-111111111111
502	FAC-20260412-9259	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:20:39.754082+00	3	174	2026-04-12 22:20:39.754082+00	\N	2026-04-12 22:20:39.754082+00	11111111-1111-1111-1111-111111111111
503	FAC-20260412-0418	\N	3	50	350	0	0	350	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:27:50.902247+00	\N	\N	2026-04-12 22:27:50.902247+00	\N	2026-04-12 22:27:50.902247+00	11111111-1111-1111-1111-111111111111
504	FAC-20260412-8318	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:40:39.139175+00	\N	\N	2026-04-12 22:40:39.139175+00	\N	2026-04-12 22:40:39.139175+00	11111111-1111-1111-1111-111111111111
505	FAC-20260412-4146	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:49:14.801463+00	\N	\N	2026-04-12 22:49:14.801463+00	\N	2026-04-12 22:49:14.801463+00	11111111-1111-1111-1111-111111111111
506	FAC-20260412-9973	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:49:50.881192+00	\N	\N	2026-04-12 22:49:50.881192+00	\N	2026-04-12 22:49:50.881192+00	11111111-1111-1111-1111-111111111111
507	FAC-20260412-8092	\N	3	50	1215	0	0	1215	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:57:58.610382+00	4	176	2026-04-12 22:57:58.610382+00	\N	2026-04-12 22:57:58.610382+00	11111111-1111-1111-1111-111111111111
508	FAC-20260412-6156	\N	3	50	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 22:59:16.64053+00	13	170	2026-04-12 22:59:16.64053+00	\N	2026-04-12 22:59:16.64053+00	11111111-1111-1111-1111-111111111111
509	FAC-20260412-4452	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:16:15.11803+00	\N	\N	2026-04-12 23:16:15.11803+00	\N	2026-04-12 23:16:15.11803+00	11111111-1111-1111-1111-111111111111
510	FAC-20260412-5984	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:16:16.453862+00	\N	\N	2026-04-12 23:16:16.453862+00	\N	2026-04-12 23:16:16.453862+00	11111111-1111-1111-1111-111111111111
511	FAC-20260412-3196	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:26:13.934302+00	\N	\N	2026-04-12 23:26:13.934302+00	\N	2026-04-12 23:26:13.934302+00	11111111-1111-1111-1111-111111111111
512	FAC-20260412-3284	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:29:13.819504+00	\N	\N	2026-04-12 23:29:13.819504+00	\N	2026-04-12 23:29:13.819504+00	11111111-1111-1111-1111-111111111111
513	FAC-20260412-6033	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:33:07.011634+00	\N	\N	2026-04-12 23:33:07.011634+00	\N	2026-04-12 23:33:07.011634+00	11111111-1111-1111-1111-111111111111
514	FAC-20260412-0745	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:33:51.247398+00	\N	\N	2026-04-12 23:33:51.247398+00	\N	2026-04-12 23:33:51.247398+00	11111111-1111-1111-1111-111111111111
515	FAC-20260412-8805	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:42:09.29591+00	\N	\N	2026-04-12 23:42:09.29591+00	\N	2026-04-12 23:42:09.29591+00	11111111-1111-1111-1111-111111111111
516	FAC-20260412-9843	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:42:50.31157+00	\N	\N	2026-04-12 23:42:50.31157+00	\N	2026-04-12 23:42:50.31157+00	11111111-1111-1111-1111-111111111111
517	FAC-20260412-8275	\N	3	50	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:44:48.721467+00	\N	\N	2026-04-12 23:44:48.721467+00	\N	2026-04-12 23:44:48.721467+00	11111111-1111-1111-1111-111111111111
518	FAC-20260412-7908	\N	3	50	100	0	0	100	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:46:48.381642+00	\N	\N	2026-04-12 23:46:48.381642+00	\N	2026-04-12 23:46:48.381642+00	11111111-1111-1111-1111-111111111111
519	FAC-20260412-0433	\N	3	50	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-12 23:48:40.891044+00	\N	\N	2026-04-12 23:48:40.891044+00	\N	2026-04-12 23:48:40.891044+00	11111111-1111-1111-1111-111111111111
520	FAC-20260412-3576	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:14:54.258117+00	\N	\N	2026-04-13 00:14:54.258117+00	\N	2026-04-13 00:14:54.258117+00	11111111-1111-1111-1111-111111111111
521	FAC-20260412-6905	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:28:07.554414+00	\N	\N	2026-04-13 00:28:07.554414+00	\N	2026-04-13 00:28:07.554414+00	11111111-1111-1111-1111-111111111111
522	FAC-20260412-6723	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:33:27.173126+00	\N	\N	2026-04-13 00:33:27.173126+00	\N	2026-04-13 00:33:27.173126+00	11111111-1111-1111-1111-111111111111
523	FAC-20260412-0546	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:36:20.97698+00	\N	\N	2026-04-13 00:36:20.97698+00	\N	2026-04-13 00:36:20.97698+00	11111111-1111-1111-1111-111111111111
524	FAC-20260412-0917	\N	3	50	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:39:51.316214+00	\N	\N	2026-04-13 00:39:51.316214+00	\N	2026-04-13 00:39:51.316214+00	11111111-1111-1111-1111-111111111111
525	FAC-20260412-0733	\N	3	50	700	0	0	700	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:42:31.178074+00	12	180	2026-04-13 00:42:31.178074+00	\N	2026-04-13 00:42:31.178074+00	11111111-1111-1111-1111-111111111111
526	FAC-20260412-2647	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:43:23.23059+00	\N	\N	2026-04-13 00:43:23.23059+00	\N	2026-04-13 00:43:23.23059+00	11111111-1111-1111-1111-111111111111
527	FAC-20260412-0651	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:47:51.040971+00	1	181	2026-04-13 00:47:51.040971+00	\N	2026-04-13 00:47:51.040971+00	11111111-1111-1111-1111-111111111111
528	FAC-20260412-7578	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:49:07.982192+00	\N	\N	2026-04-13 00:49:07.982192+00	\N	2026-04-13 00:49:07.982192+00	11111111-1111-1111-1111-111111111111
529	FAC-20260412-0721	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:54:41.126011+00	\N	\N	2026-04-13 00:54:41.126011+00	\N	2026-04-13 00:54:41.126011+00	11111111-1111-1111-1111-111111111111
530	FAC-20260412-6637	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 00:58:17.058316+00	12	184	2026-04-13 00:58:17.058316+00	\N	2026-04-13 00:58:17.058316+00	11111111-1111-1111-1111-111111111111
531	FAC-20260412-6974	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:00:27.369508+00	\N	\N	2026-04-13 01:00:27.369508+00	\N	2026-04-13 01:00:27.369508+00	11111111-1111-1111-1111-111111111111
532	FAC-20260412-7033	\N	3	50	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:02:27.816736+00	\N	\N	2026-04-13 01:02:27.816736+00	\N	2026-04-13 01:02:27.816736+00	11111111-1111-1111-1111-111111111111
533	FAC-20260412-9691	\N	3	50	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:02:30.089377+00	\N	\N	2026-04-13 01:02:30.089377+00	\N	2026-04-13 01:02:30.089377+00	11111111-1111-1111-1111-111111111111
534	FAC-20260412-2021	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:04:12.41566+00	\N	\N	2026-04-13 01:04:12.41566+00	\N	2026-04-13 01:04:12.41566+00	11111111-1111-1111-1111-111111111111
535	FAC-20260412-3267	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:04:13.643789+00	\N	\N	2026-04-13 01:04:13.643789+00	\N	2026-04-13 01:04:13.643789+00	11111111-1111-1111-1111-111111111111
536	FAC-20260412-1724	\N	3	50	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:05:42.113926+00	\N	\N	2026-04-13 01:05:42.113926+00	\N	2026-04-13 01:05:42.113926+00	11111111-1111-1111-1111-111111111111
537	FAC-20260412-4683	\N	3	50	60	0	0	60	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:10:45.08566+00	\N	\N	2026-04-13 01:10:45.08566+00	\N	2026-04-13 01:10:45.08566+00	11111111-1111-1111-1111-111111111111
538	FAC-20260412-0396	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:23:31.034402+00	\N	\N	2026-04-13 01:23:31.034402+00	\N	2026-04-13 01:23:31.034402+00	11111111-1111-1111-1111-111111111111
539	FAC-20260412-1976	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:23:32.374843+00	\N	\N	2026-04-13 01:23:32.374843+00	\N	2026-04-13 01:23:32.374843+00	11111111-1111-1111-1111-111111111111
540	FAC-20260412-5757	\N	3	50	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:29:26.353868+00	\N	\N	2026-04-13 01:29:26.353868+00	\N	2026-04-13 01:29:26.353868+00	11111111-1111-1111-1111-111111111111
542	FAC-20260412-5213	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:37:15.561422+00	\N	\N	2026-04-13 01:37:15.561422+00	\N	2026-04-13 01:37:15.561422+00	11111111-1111-1111-1111-111111111111
543	FAC-20260412-7347	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:42:37.824724+00	\N	\N	2026-04-13 01:42:37.824724+00	\N	2026-04-13 01:42:37.824724+00	11111111-1111-1111-1111-111111111111
544	FAC-20260412-8198	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:42:38.528369+00	\N	\N	2026-04-13 01:42:38.528369+00	\N	2026-04-13 01:42:38.528369+00	11111111-1111-1111-1111-111111111111
545	FAC-20260412-8305	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:43:58.750861+00	\N	\N	2026-04-13 01:43:58.750861+00	\N	2026-04-13 01:43:58.750861+00	11111111-1111-1111-1111-111111111111
546	FAC-20260412-0657	\N	3	50	500	0	0	500	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:45:01.071751+00	\N	\N	2026-04-13 01:45:01.071751+00	\N	2026-04-13 01:45:01.071751+00	11111111-1111-1111-1111-111111111111
547	FAC-20260412-0660	\N	3	50	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:51:51.189336+00	\N	\N	2026-04-13 01:51:51.189336+00	\N	2026-04-13 01:51:51.189336+00	11111111-1111-1111-1111-111111111111
548	FAC-20260412-8911	\N	3	50	1200	0	0	1200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:57:09.237656+00	13	179	2026-04-13 01:57:09.237656+00	\N	2026-04-13 01:57:09.237656+00	11111111-1111-1111-1111-111111111111
549	FAC-20260412-8817	\N	3	50	1200	0	0	1200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 01:58:09.141803+00	4	177	2026-04-13 01:58:09.141803+00	\N	2026-04-13 01:58:09.141803+00	11111111-1111-1111-1111-111111111111
550	FAC-20260412-6392	\N	3	50	30	0	0	30	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 02:08:56.779294+00	\N	\N	2026-04-13 02:08:56.779294+00	\N	2026-04-13 02:08:56.779294+00	11111111-1111-1111-1111-111111111111
551	FAC-20260412-4242	\N	3	50	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 02:21:24.571373+00	4	187	2026-04-13 02:21:24.571373+00	\N	2026-04-13 02:21:24.571373+00	11111111-1111-1111-1111-111111111111
552	FAC-20260412-0801	\N	3	50	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 02:23:01.106935+00	\N	\N	2026-04-13 02:23:01.106935+00	\N	2026-04-13 02:23:01.106935+00	11111111-1111-1111-1111-111111111111
553	FAC-20260412-2685	\N	3	50	30	0	0	30	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 02:23:33.013682+00	\N	\N	2026-04-13 02:23:33.013682+00	\N	2026-04-13 02:23:33.013682+00	11111111-1111-1111-1111-111111111111
554	FAC-20260412-1445	\N	3	50	350	0	0	350	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 02:52:01.811541+00	\N	\N	2026-04-13 02:52:01.811541+00	\N	2026-04-13 02:52:01.811541+00	11111111-1111-1111-1111-111111111111
555	FAC-20260412-8525	\N	3	50	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 02:56:58.827864+00	5	189	2026-04-13 02:56:58.827864+00	\N	2026-04-13 02:56:58.827864+00	11111111-1111-1111-1111-111111111111
556	FAC-20260412-5510	\N	3	50	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 03:11:25.799857+00	12	186	2026-04-13 03:11:25.799857+00	\N	2026-04-13 03:11:25.799857+00	11111111-1111-1111-1111-111111111111
557	FAC-20260412-3850	\N	3	50	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 03:20:14.119861+00	\N	\N	2026-04-13 03:20:14.119861+00	\N	2026-04-13 03:20:14.119861+00	11111111-1111-1111-1111-111111111111
558	FAC-20260412-6292	\N	3	50	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 03:21:06.561198+00	4	188	2026-04-13 03:21:06.561198+00	\N	2026-04-13 03:21:06.561198+00	11111111-1111-1111-1111-111111111111
559	FAC-20260412-8149	\N	3	50	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 03:29:28.448404+00	3	185	2026-04-13 03:29:28.448404+00	\N	2026-04-13 03:29:28.448404+00	11111111-1111-1111-1111-111111111111
560	FAC-20260412-2422	\N	3	50	500	0	0	500	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 03:33:52.674297+00	6	183	2026-04-13 03:33:52.674297+00	\N	2026-04-13 03:33:52.674297+00	11111111-1111-1111-1111-111111111111
561	FAC-20260413-1535	\N	3	51	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 21:50:34.114121+00	\N	\N	2026-04-13 21:50:34.114121+00	\N	2026-04-13 21:50:34.114121+00	11111111-1111-1111-1111-111111111111
562	FAC-20260413-2599	\N	3	51	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-13 22:35:24.857113+00	3	190	2026-04-13 22:35:24.857113+00	\N	2026-04-13 22:35:24.857113+00	11111111-1111-1111-1111-111111111111
563	FAC-20260413-0075	\N	3	51	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-14 00:16:02.260615+00	3	191	2026-04-14 00:16:02.260615+00	\N	2026-04-14 00:16:02.260615+00	11111111-1111-1111-1111-111111111111
564	FAC-20260413-0722	\N	3	51	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-14 01:11:23.053409+00	\N	\N	2026-04-14 01:11:23.053409+00	\N	2026-04-14 01:11:23.053409+00	11111111-1111-1111-1111-111111111111
565	FAC-20260413-8675	\N	3	51	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-14 01:13:50.951839+00	\N	\N	2026-04-14 01:13:50.951839+00	\N	2026-04-14 01:13:50.951839+00	11111111-1111-1111-1111-111111111111
566	FAC-20260414-2611	\N	3	51	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-14 23:20:15.995457+00	\N	\N	2026-04-14 23:20:15.995457+00	\N	2026-04-14 23:20:15.995457+00	11111111-1111-1111-1111-111111111111
567	FAC-20260414-9746	\N	3	51	250	0	0	250	efectivo	contado	completada	\N	\N	\N	\N	2026-04-15 00:26:03.202535+00	\N	\N	2026-04-15 00:26:03.202535+00	\N	2026-04-15 00:26:03.202535+00	11111111-1111-1111-1111-111111111111
568	FAC-20260414-4722	\N	3	51	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-15 01:43:07.83362+00	3	192	2026-04-15 01:43:07.83362+00	\N	2026-04-15 01:43:07.83362+00	11111111-1111-1111-1111-111111111111
569	FAC-20260414-0544	\N	3	51	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-15 03:12:03.618334+00	5	194	2026-04-15 03:12:03.618334+00	\N	2026-04-15 03:12:03.618334+00	11111111-1111-1111-1111-111111111111
570	FAC-20260414-8682	\N	3	51	1100	0	0	1100	efectivo	contado	completada	\N	\N	\N	\N	2026-04-15 03:38:01.712661+00	13	195	2026-04-15 03:38:01.712661+00	\N	2026-04-15 03:38:01.712661+00	11111111-1111-1111-1111-111111111111
571	FAC-20260414-6396	\N	3	51	850	0	0	850	efectivo	contado	completada	\N	\N	\N	\N	2026-04-15 03:38:39.406805+00	12	196	2026-04-15 03:38:39.406805+00	\N	2026-04-15 03:38:39.406805+00	11111111-1111-1111-1111-111111111111
572	FAC-20260414-9681	\N	3	51	1200	0	0	1200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-15 03:40:52.698059+00	4	193	2026-04-15 03:40:52.698059+00	\N	2026-04-15 03:40:52.698059+00	11111111-1111-1111-1111-111111111111
573	FAC-20260414-6068	\N	3	51	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-15 03:41:09.091263+00	3	197	2026-04-15 03:41:09.091263+00	\N	2026-04-15 03:41:09.091263+00	11111111-1111-1111-1111-111111111111
574	FAC-20260415-4343	\N	3	52	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-15 22:38:08.71528+00	13	198	2026-04-15 22:38:08.71528+00	\N	2026-04-15 22:38:08.71528+00	11111111-1111-1111-1111-111111111111
575	FAC-20260415-0115	\N	3	52	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-16 03:16:34.145524+00	6	200	2026-04-16 03:16:34.145524+00	\N	2026-04-16 03:16:34.145524+00	11111111-1111-1111-1111-111111111111
576	FAC-20260415-4953	\N	3	52	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-16 03:21:59.325083+00	12	199	2026-04-16 03:21:59.325083+00	\N	2026-04-16 03:21:59.325083+00	11111111-1111-1111-1111-111111111111
577	FAC-20260415-7142	\N	3	52	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-16 03:26:21.220303+00	\N	\N	2026-04-16 03:26:21.220303+00	\N	2026-04-16 03:26:21.220303+00	11111111-1111-1111-1111-111111111111
578	FAC-20260416-3940	\N	3	53	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-16 22:32:59.098665+00	12	204	2026-04-16 22:32:59.098665+00	\N	2026-04-16 22:32:59.098665+00	11111111-1111-1111-1111-111111111111
579	FAC-20260416-2453	\N	3	53	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-16 22:51:17.56543+00	\N	\N	2026-04-16 22:51:17.56543+00	\N	2026-04-16 22:51:17.56543+00	11111111-1111-1111-1111-111111111111
580	FAC-20260416-2378	\N	3	53	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-16 23:00:47.463774+00	\N	\N	2026-04-16 23:00:47.463774+00	\N	2026-04-16 23:00:47.463774+00	11111111-1111-1111-1111-111111111111
581	FAC-20260416-9135	\N	3	53	850	0	0	850	efectivo	contado	completada	\N	\N	\N	\N	2026-04-16 23:36:54.469406+00	4	203	2026-04-16 23:36:54.469406+00	\N	2026-04-16 23:36:54.469406+00	11111111-1111-1111-1111-111111111111
582	FAC-20260416-2955	\N	3	53	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-16 23:39:28.156516+00	\N	\N	2026-04-16 23:39:28.156516+00	\N	2026-04-16 23:39:28.156516+00	11111111-1111-1111-1111-111111111111
583	FAC-20260416-2310	\N	3	53	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 01:41:47.465663+00	13	206	2026-04-17 01:41:47.465663+00	\N	2026-04-17 01:41:47.465663+00	11111111-1111-1111-1111-111111111111
584	FAC-20260416-8915	\N	3	53	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 02:22:33.874994+00	\N	\N	2026-04-17 02:22:33.874994+00	\N	2026-04-17 02:22:33.874994+00	11111111-1111-1111-1111-111111111111
585	FAC-20260417-9993	\N	3	54	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 21:50:45.832261+00	\N	\N	2026-04-17 21:50:45.832261+00	\N	2026-04-17 21:50:45.832261+00	11111111-1111-1111-1111-111111111111
586	FAC-20260417-6374	\N	3	54	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 22:38:02.041489+00	11	209	2026-04-17 22:38:02.041489+00	\N	2026-04-17 22:38:02.041489+00	11111111-1111-1111-1111-111111111111
587	FAC-20260417-0447	\N	3	54	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 22:43:26.19149+00	\N	\N	2026-04-17 22:43:26.19149+00	\N	2026-04-17 22:43:26.19149+00	11111111-1111-1111-1111-111111111111
588	FAC-20260417-2638	\N	3	54	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 22:46:08.497591+00	\N	\N	2026-04-17 22:46:08.497591+00	\N	2026-04-17 22:46:08.497591+00	11111111-1111-1111-1111-111111111111
589	FAC-20260417-7250	\N	3	54	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 22:55:52.987935+00	\N	\N	2026-04-17 22:55:52.987935+00	\N	2026-04-17 22:55:52.987935+00	11111111-1111-1111-1111-111111111111
590	FAC-20260417-7694	\N	3	54	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 23:04:03.361151+00	12	213	2026-04-17 23:04:03.361151+00	\N	2026-04-17 23:04:03.361151+00	11111111-1111-1111-1111-111111111111
591	FAC-20260417-5850	\N	3	54	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 23:08:11.511211+00	\N	\N	2026-04-17 23:08:11.511211+00	\N	2026-04-17 23:08:11.511211+00	11111111-1111-1111-1111-111111111111
592	FAC-20260417-8732	\N	3	54	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 23:20:34.382377+00	12	214	2026-04-17 23:20:34.382377+00	\N	2026-04-17 23:20:34.382377+00	11111111-1111-1111-1111-111111111111
593	FAC-20260417-1932	\N	3	54	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 23:37:37.583867+00	\N	\N	2026-04-17 23:37:37.583867+00	\N	2026-04-17 23:37:37.583867+00	11111111-1111-1111-1111-111111111111
594	FAC-20260417-9034	\N	3	54	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 23:49:24.84965+00	\N	\N	2026-04-17 23:49:24.84965+00	\N	2026-04-17 23:49:24.84965+00	11111111-1111-1111-1111-111111111111
595	FAC-20260417-4643	\N	3	54	225	0	0	225	efectivo	contado	completada	\N	\N	\N	\N	2026-04-17 23:54:20.326989+00	\N	\N	2026-04-17 23:54:20.326989+00	\N	2026-04-17 23:54:20.326989+00	11111111-1111-1111-1111-111111111111
596	FAC-20260417-5229	\N	3	54	50	0	0	50	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 00:02:21.099807+00	\N	\N	2026-04-18 00:02:21.099807+00	\N	2026-04-18 00:02:21.099807+00	11111111-1111-1111-1111-111111111111
597	FAC-20260417-8358	\N	3	54	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 00:11:44.013076+00	1	215	2026-04-18 00:11:44.013076+00	\N	2026-04-18 00:11:44.013076+00	11111111-1111-1111-1111-111111111111
598	FAC-20260417-1241	\N	3	54	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 00:16:06.915263+00	\N	\N	2026-04-18 00:16:06.915263+00	\N	2026-04-18 00:16:06.915263+00	11111111-1111-1111-1111-111111111111
599	FAC-20260417-7704	\N	3	54	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 00:27:13.315719+00	13	212	2026-04-18 00:27:13.315719+00	\N	2026-04-18 00:27:13.315719+00	11111111-1111-1111-1111-111111111111
600	FAC-20260417-5316	\N	3	54	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 03:38:51.058916+00	13	216	2026-04-18 03:38:51.058916+00	\N	2026-04-18 03:38:51.058916+00	11111111-1111-1111-1111-111111111111
601	FAC-20260417-3083	\N	3	54	100	0	0	100	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 03:40:38.716222+00	\N	\N	2026-04-18 03:40:38.716222+00	\N	2026-04-18 03:40:38.716222+00	11111111-1111-1111-1111-111111111111
602	FAC-20260418-9855	\N	3	55	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 21:02:37.453346+00	3	217	2026-04-18 21:02:37.453346+00	\N	2026-04-18 21:02:37.453346+00	11111111-1111-1111-1111-111111111111
603	FAC-20260418-8247	\N	3	55	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 21:11:55.712923+00	\N	\N	2026-04-18 21:11:55.712923+00	\N	2026-04-18 21:11:55.712923+00	11111111-1111-1111-1111-111111111111
604	FAC-20260418-3964	\N	3	55	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 21:59:11.372666+00	\N	\N	2026-04-18 21:59:11.372666+00	\N	2026-04-18 21:59:11.372666+00	11111111-1111-1111-1111-111111111111
605	FAC-20260418-4153	\N	3	55	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 22:29:01.39727+00	13	221	2026-04-18 22:29:01.39727+00	\N	2026-04-18 22:29:01.39727+00	11111111-1111-1111-1111-111111111111
606	FAC-20260418-3908	\N	3	55	800	0	0	800	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 23:20:31.16993+00	12	220	2026-04-18 23:20:31.16993+00	\N	2026-04-18 23:20:31.16993+00	11111111-1111-1111-1111-111111111111
607	FAC-20260418-8721	\N	3	55	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-18 23:56:26.070237+00	\N	\N	2026-04-18 23:56:26.070237+00	\N	2026-04-18 23:56:26.070237+00	11111111-1111-1111-1111-111111111111
608	FAC-20260418-1062	\N	3	55	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 01:33:48.151324+00	12	223	2026-04-19 01:33:48.151324+00	\N	2026-04-19 01:33:48.151324+00	11111111-1111-1111-1111-111111111111
609	FAC-20260418-2751	\N	3	55	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 01:33:49.768236+00	12	223	2026-04-19 01:33:49.768236+00	\N	2026-04-19 01:33:49.768236+00	11111111-1111-1111-1111-111111111111
610	FAC-20260418-6762	\N	3	55	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 02:03:33.774324+00	11	225	2026-04-19 02:03:33.774324+00	\N	2026-04-19 02:03:33.774324+00	11111111-1111-1111-1111-111111111111
611	FAC-20260418-3437	\N	3	55	600	0	0	600	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 02:19:20.60941+00	12	224	2026-04-19 02:19:20.60941+00	\N	2026-04-19 02:19:20.60941+00	11111111-1111-1111-1111-111111111111
612	FAC-20260418-5973	\N	3	55	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 02:41:53.248665+00	12	226	2026-04-19 02:41:53.248665+00	\N	2026-04-19 02:41:53.248665+00	11111111-1111-1111-1111-111111111111
613	FAC-20260418-9612	\N	3	55	150	0	0	150	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 02:54:16.611606+00	\N	\N	2026-04-19 02:54:16.611606+00	\N	2026-04-19 02:54:16.611606+00	11111111-1111-1111-1111-111111111111
614	FAC-20260418-2167	\N	3	55	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 02:55:39.142256+00	\N	\N	2026-04-19 02:55:39.142256+00	\N	2026-04-19 02:55:39.142256+00	11111111-1111-1111-1111-111111111111
615	FAC-20260418-9940	\N	3	55	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 03:30:27.203832+00	12	227	2026-04-19 03:30:27.203832+00	\N	2026-04-19 03:30:27.203832+00	11111111-1111-1111-1111-111111111111
616	FAC-20260419-9544	\N	3	56	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 21:17:48.351128+00	13	228	2026-04-19 21:17:48.351128+00	\N	2026-04-19 21:17:48.351128+00	11111111-1111-1111-1111-111111111111
617	FAC-20260419-1704	\N	3	56	400	0	0	400	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 21:17:50.266704+00	13	228	2026-04-19 21:17:50.266704+00	\N	2026-04-19 21:17:50.266704+00	11111111-1111-1111-1111-111111111111
618	FAC-20260419-0475	\N	3	56	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 22:01:48.992176+00	\N	\N	2026-04-19 22:01:48.992176+00	\N	2026-04-19 22:01:48.992176+00	11111111-1111-1111-1111-111111111111
619	FAC-20260419-2421	\N	3	56	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 22:17:51.218786+00	\N	\N	2026-04-19 22:17:51.218786+00	\N	2026-04-19 22:17:51.218786+00	11111111-1111-1111-1111-111111111111
620	FAC-20260419-0194	\N	3	56	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 23:00:28.668351+00	\N	\N	2026-04-19 23:00:28.668351+00	\N	2026-04-19 23:00:28.668351+00	11111111-1111-1111-1111-111111111111
621	FAC-20260419-4777	\N	3	56	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 23:07:43.267179+00	\N	\N	2026-04-19 23:07:43.267179+00	\N	2026-04-19 23:07:43.267179+00	11111111-1111-1111-1111-111111111111
622	FAC-20260419-9552	\N	3	56	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-19 23:29:08.091758+00	3	229	2026-04-19 23:29:08.091758+00	\N	2026-04-19 23:29:08.091758+00	11111111-1111-1111-1111-111111111111
623	FAC-20260419-3635	\N	3	56	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-20 01:03:02.101833+00	\N	\N	2026-04-20 01:03:02.101833+00	\N	2026-04-20 01:03:02.101833+00	11111111-1111-1111-1111-111111111111
624	FAC-20260419-8805	\N	3	56	650	0	0	650	efectivo	contado	completada	\N	\N	\N	\N	2026-04-20 02:12:17.34064+00	2	230	2026-04-20 02:12:17.34064+00	\N	2026-04-20 02:12:17.34064+00	11111111-1111-1111-1111-111111111111
625	FAC-20260420-0663	\N	3	58	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-20 23:26:30.230439+00	13	232	2026-04-20 23:26:30.230439+00	\N	2026-04-20 23:26:30.230439+00	11111111-1111-1111-1111-111111111111
626	FAC-20260420-3906	\N	3	58	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-20 23:36:43.398325+00	13	233	2026-04-20 23:36:43.398325+00	\N	2026-04-20 23:36:43.398325+00	11111111-1111-1111-1111-111111111111
627	FAC-20260420-7829	\N	3	58	300	0	0	300	efectivo	contado	completada	\N	\N	\N	\N	2026-04-20 23:57:47.477195+00	13	234	2026-04-20 23:57:47.477195+00	\N	2026-04-20 23:57:47.477195+00	11111111-1111-1111-1111-111111111111
628	FAC-20260420-5153	\N	3	58	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-21 00:34:44.778348+00	\N	\N	2026-04-21 00:34:44.778348+00	\N	2026-04-21 00:34:44.778348+00	11111111-1111-1111-1111-111111111111
629	FAC-20260420-6859	\N	3	58	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-21 00:34:46.266996+00	\N	\N	2026-04-21 00:34:46.266996+00	\N	2026-04-21 00:34:46.266996+00	11111111-1111-1111-1111-111111111111
630	FAC-20260420-1976	\N	3	58	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-21 01:56:01.704729+00	\N	\N	2026-04-21 01:56:01.704729+00	\N	2026-04-21 01:56:01.704729+00	11111111-1111-1111-1111-111111111111
631	FAC-20260420-5204	\N	3	58	200	0	0	200	efectivo	contado	completada	\N	\N	\N	\N	2026-04-21 03:18:44.870298+00	\N	\N	2026-04-21 03:18:44.870298+00	\N	2026-04-21 03:18:44.870298+00	11111111-1111-1111-1111-111111111111
649	FAC-20260423-9318	\N	2	62	15	0	0	15	efectivo	\N	cancelada	\N	\N	\N	\N	2026-04-23 03:22:03.744412+00	\N	\N	2026-04-23 03:22:03.744412+00	\N	2026-04-23 03:22:03.744412+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
663	FAC-20260424-301	\N	3	67	30	0	0	30	efectivo	\N	completada	\N	\N	\N	\N	2026-04-24 20:45:55.560386+00	\N	\N	2026-04-24 20:45:55.560386+00	\N	2026-04-24 20:45:55.560386+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
677	FAC-20260425-6650	\N	3	68	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-25 21:06:43.573601+00	\N	\N	2026-04-25 21:06:43.573601+00	\N	2026-04-25 21:06:43.573601+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
691	FAC-20260426-2929	\N	3	69	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-04-26 21:39:56.347183+00	\N	\N	2026-04-26 21:39:56.347183+00	\N	2026-04-26 21:39:56.347183+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
705	FAC-20260501-6584	\N	3	72	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-01 00:31:28.441615+00	\N	\N	2026-05-01 00:31:28.441615+00	\N	2026-05-01 00:31:28.441615+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
720	FAC-20260502-9737	\N	3	74	200	0	0	200	efectivo	\N	completada	\N	\N	\N	\N	2026-05-02 02:57:56.840588+00	\N	\N	2026-05-02 02:57:56.840588+00	\N	2026-05-02 02:57:56.840588+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
734	FAC-20260503-7284	\N	3	75	600	0	0	600	efectivo	\N	completada	\N	\N	\N	\N	2026-05-03 03:54:15.706483+00	\N	\N	2026-05-03 03:54:15.706483+00	\N	2026-05-03 03:54:15.706483+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
748	FAC-20260505-3237	\N	3	78	400	0	0	400	efectivo	\N	completada	\N	\N	\N	\N	2026-05-05 23:28:53.056794+00	\N	\N	2026-05-05 23:28:53.056794+00	\N	2026-05-05 23:28:53.056794+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
764	FAC-20260513-486	\N	3	82	1100	0	0	1100	efectivo	\N	completada	\N	\N	\N	\N	2026-05-13 01:08:09.01458+00	\N	\N	2026-05-13 01:08:09.01458+00	\N	2026-05-13 01:08:09.01458+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3
\.


--
-- Data for Name: ventas_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_detalle (id, venta_id, producto_id, producto_nombre, cantidad, precio_unitario, descuento, subtotal, created_at, negocio_id, notas) FROM stdin;
1	1	1	Cerveza Presidente	1	200	0	200	2026-02-24 18:50:48.800631+00	\N	\N
2	2	1	Cerveza Presidente	2	200	0	400	2026-02-24 20:06:03.230177+00	\N	\N
3	3	1	Cerveza Presidente	1	200	0	200	2026-02-24 20:57:30.800572+00	\N	\N
4	4	1	Cerveza Presidente	2	200	0	400	2026-02-24 20:59:53.365352+00	\N	\N
5	5	1	Cerveza Presidente	1	200	0	200	2026-02-25 18:20:38.230049+00	\N	\N
6	6	1	Cerveza Presidente	1	200	0	200	2026-02-25 18:20:39.182313+00	\N	\N
7	7	1	Cerveza Presidente	1	200	0	200	2026-02-25 19:55:52.285387+00	\N	\N
8	8	1	Cerveza Presidente	1	200	0	200	2026-02-25 20:41:15.279156+00	\N	\N
9	9	1	Cerveza Presidente	1	200	0	200	2026-02-25 20:59:22.055237+00	\N	\N
10	10	1	Cerveza Presidente	2	200	0	400	2026-02-25 21:01:07.598085+00	\N	\N
11	11	1	Cerveza Presidente	1	200	0	200	2026-02-25 22:10:39.770868+00	\N	\N
12	12	1	Cerveza Presidente	1	200	0	200	2026-02-25 22:14:14.158725+00	\N	\N
13	13	9	one gra	1	175	0	175	2026-03-27 14:28:40.890962+00	\N	\N
14	14	2	presi normal gr	3	200	0	600	2026-03-28 21:40:08.675197+00	\N	\N
15	15	2	presi normal gr	2	200	0	400	2026-03-28 22:24:57.742455+00	\N	\N
16	16	2	presi normal gr	1	200	0	200	2026-03-28 23:29:55.25403+00	\N	\N
17	17	2	presi normal gr	1	200	0	200	2026-03-28 23:31:28.328486+00	\N	\N
18	18	2	presi normal gr	1	200	0	200	2026-03-28 23:40:43.459583+00	\N	\N
19	19	2	presi normal gr	1	200	0	200	2026-03-28 23:52:35.895465+00	\N	\N
20	20	2	presi normal gr	1	200	0	200	2026-03-28 23:56:54.664236+00	\N	\N
21	21	2	presi normal gr	1	200	0	200	2026-03-29 00:14:48.022296+00	\N	\N
22	22	2	presi normal gr	1	200	0	200	2026-03-29 00:23:26.256784+00	\N	\N
23	23	2	presi normal gr	1	200	0	200	2026-03-29 00:37:07.12834+00	\N	\N
24	24	2	presi normal gr	1	200	0	200	2026-03-29 00:41:04.077126+00	\N	\N
25	25	2	presi normal gr	1	200	0	200	2026-03-29 00:44:26.719765+00	\N	\N
26	26	2	presi normal gr	1	200	0	200	2026-03-29 00:51:43.197751+00	\N	\N
27	27	2	presi normal gr	1	200	0	200	2026-03-29 00:54:44.347475+00	\N	\N
28	28	2	presi normal gr	2	200	0	400	2026-03-29 01:05:35.285125+00	\N	\N
29	29	2	presi normal gr	1	200	0	200	2026-03-29 01:07:57.568242+00	\N	\N
30	30	2	presi normal gr	1	200	0	200	2026-03-29 01:11:38.648177+00	\N	\N
31	31	2	presi normal gr	1	200	0	200	2026-03-29 01:19:14.285704+00	\N	\N
32	32	2	presi normal gr	1	200	0	200	2026-03-29 01:23:16.792575+00	\N	\N
33	33	2	presi normal gr	1	200	0	200	2026-03-29 01:23:46.635305+00	\N	\N
34	34	2	presi normal gr	1	200	0	200	2026-03-29 01:36:38.365445+00	\N	\N
35	35	1	presi light gr 	2	200	0	400	2026-03-29 01:41:31.416564+00	\N	\N
36	36	1	presi light gr 	1	200	0	200	2026-03-29 01:43:08.102687+00	\N	\N
37	37	1	presi light gr 	1	200	0	200	2026-03-29 01:55:02.103813+00	\N	\N
38	38	2	presi normal gr	2	200	0	400	2026-03-29 01:56:20.287457+00	\N	\N
39	39	8	modelo peq	1	200	0	200	2026-03-29 02:03:06.037462+00	\N	\N
40	40	1	presi light gr 	1	200	0	200	2026-03-29 02:04:01.976218+00	\N	\N
41	41	12	seven up	1	50	0	50	2026-03-29 02:04:29.804251+00	\N	\N
42	42	2	presi normal gr	1	200	0	200	2026-03-29 02:15:02.63908+00	\N	\N
43	43	2	presi normal gr	1	200	0	200	2026-03-29 02:19:14.15059+00	\N	\N
44	43	1	presi light gr 	1	200	0	200	2026-03-29 02:19:14.15059+00	\N	\N
45	44	2	presi normal gr	1	200	0	200	2026-03-29 02:23:33.612332+00	\N	\N
46	45	2	presi normal gr	1	200	0	200	2026-03-29 02:24:37.82248+00	\N	\N
47	46	1	presi light gr 	1	200	0	200	2026-03-29 02:29:23.860305+00	\N	\N
48	47	1	presi light gr 	1	200	0	200	2026-03-29 02:29:25.235545+00	\N	\N
49	48	2	presi normal gr	1	200	0	200	2026-03-29 02:34:23.145291+00	\N	\N
50	49	1	presi light gr 	1	200	0	200	2026-03-29 02:36:01.380755+00	\N	\N
51	50	2	presi normal gr	2	200	0	400	2026-03-29 02:44:51.335397+00	\N	\N
52	51	2	presi normal gr	1	200	0	200	2026-03-29 02:45:20.42034+00	\N	\N
53	52	2	presi normal gr	1	200	0	200	2026-03-29 02:45:37.82512+00	\N	\N
54	53	1	presi light gr 	1	200	0	200	2026-03-29 02:52:28.232309+00	\N	\N
55	54	1	presi light gr 	1	200	0	200	2026-03-29 02:57:19.386161+00	\N	\N
56	55	1	presi light gr 	1	200	0	200	2026-03-29 03:02:59.450423+00	\N	\N
57	56	1	presi light gr 	1	200	0	200	2026-03-29 03:03:00.733021+00	\N	\N
58	57	2	presi normal gr	1	200	0	200	2026-03-29 03:03:37.99388+00	\N	\N
59	57	34	añejo peq	1	600	0	600	2026-03-29 03:03:37.99388+00	\N	\N
60	58	1	presi light gr 	1	200	0	200	2026-03-29 03:07:44.037847+00	\N	\N
61	59	2	presi normal gr	1	200	0	200	2026-03-29 03:08:13.054662+00	\N	\N
62	60	2	presi normal gr	1	200	0	200	2026-03-29 03:20:36.010337+00	\N	\N
63	61	1	presi light gr 	1	200	0	200	2026-03-29 03:25:55.921342+00	\N	\N
64	62	1	presi light gr 	1	200	0	200	2026-03-29 03:27:28.409435+00	\N	\N
65	62	2	presi normal gr	1	200	0	200	2026-03-29 03:27:28.409435+00	\N	\N
66	63	2	presi normal gr	1	200	0	200	2026-03-29 03:29:53.253195+00	\N	\N
67	64	2	presi normal gr	1	200	0	200	2026-03-29 03:31:16.837852+00	\N	\N
68	64	1	presi light gr 	1	200	0	200	2026-03-29 03:31:16.837852+00	\N	\N
69	65	1	presi light gr 	1	200	0	200	2026-03-29 03:32:16.65569+00	\N	\N
70	66	2	presi normal gr	1	200	0	200	2026-03-29 03:40:59.034559+00	\N	\N
71	66	1	presi light gr 	1	200	0	200	2026-03-29 03:40:59.034559+00	\N	\N
72	67	2	presi normal gr	1	200	0	200	2026-03-29 03:41:58.371174+00	\N	\N
73	67	1	presi light gr 	1	200	0	200	2026-03-29 03:41:58.371174+00	\N	\N
74	68	1	presi light gr 	1	200	0	200	2026-03-29 03:55:48.871111+00	\N	\N
75	69	1	presi light gr 	1	200	0	200	2026-03-29 04:03:46.225574+00	\N	\N
76	70	2	presi normal gr	1	200	0	200	2026-03-29 04:11:25.85909+00	\N	\N
77	71	2	presi normal gr	1	200	0	200	2026-03-29 04:12:25.915407+00	\N	\N
78	72	2	presi normal gr	1	200	0	200	2026-03-29 04:23:58.630611+00	\N	\N
79	73	9	one gra	4	175	0	700	2026-03-29 04:25:53.933079+00	\N	\N
80	74	2	presi normal gr	1	200	0	200	2026-03-29 04:31:11.83611+00	\N	\N
81	75	1	presi light gr 	3	200	0	600	2026-03-29 04:35:14.463222+00	\N	\N
82	76	2	presi normal gr	1	200	0	200	2026-03-29 04:45:36.173605+00	\N	\N
83	76	1	presi light gr 	1	200	0	200	2026-03-29 04:45:36.173605+00	\N	\N
84	77	8	modelo peq	1	200	0	200	2026-03-29 04:56:12.329725+00	\N	\N
85	78	2	presi normal gr	4	200	0	800	2026-03-29 05:00:14.565397+00	\N	\N
86	79	1	presi light gr 	5	200	0	1000	2026-03-29 20:40:12.362238+00	\N	\N
87	80	2	presi normal gr	1	200	0	200	2026-03-29 21:33:08.60241+00	\N	\N
88	80	1	presi light gr 	1	200	0	200	2026-03-29 21:33:08.60241+00	\N	\N
89	81	1	presi light gr 	3	200	0	600	2026-03-29 21:39:10.992039+00	\N	\N
90	82	1	presi light gr 	1	200	0	200	2026-03-29 21:45:29.34117+00	\N	\N
91	83	1	presi light gr 	7	200	0	1400	2026-03-29 21:49:19.494658+00	\N	\N
92	84	1	presi light gr 	1	200	0	200	2026-03-29 22:01:12.083556+00	\N	\N
93	85	1	presi light gr 	1	200	0	200	2026-03-29 22:01:13.279208+00	\N	\N
94	86	2	presi normal gr	3	200	0	600	2026-03-29 22:43:59.661409+00	\N	\N
95	87	1	presi light gr 	1	200	0	200	2026-03-29 22:44:28.319798+00	\N	\N
96	88	1	presi light gr 	5	200	0	1000	2026-03-29 23:38:14.683717+00	\N	\N
97	89	1	presi light gr 	2	200	0	400	2026-03-29 23:40:48.784159+00	\N	\N
98	90	1	presi light gr 	1	200	0	200	2026-03-29 23:48:34.470679+00	\N	\N
99	91	1	presi light gr 	1	200	0	200	2026-03-29 23:49:33.872946+00	\N	\N
100	92	1	presi light gr 	2	200	0	400	2026-03-29 23:52:42.506048+00	\N	\N
101	93	1	presi light gr 	1	200	0	200	2026-03-30 00:38:04.834959+00	\N	\N
102	94	3	presi normal peq	1	150	0	150	2026-03-30 00:44:10.036317+00	\N	\N
103	95	2	presi normal gr	1	200	0	200	2026-03-30 01:16:51.503212+00	\N	\N
104	96	1	presi light gr 	3	200	0	600	2026-03-30 01:23:07.57006+00	\N	\N
105	97	1	presi light gr 	3	200	0	600	2026-03-30 01:27:39.054729+00	\N	\N
106	98	3	presi normal peq	7	150	0	1050	2026-03-30 01:30:09.210658+00	\N	\N
107	99	3	presi normal peq	7	150	0	1050	2026-03-30 01:32:27.541684+00	\N	\N
108	100	1	presi light gr 	8	200	0	1600	2026-03-30 01:42:34.107241+00	\N	\N
109	101	1	presi light gr 	1	200	0	200	2026-03-30 01:58:10.803126+00	\N	\N
110	102	1	presi light gr 	1	200	0	200	2026-03-30 02:03:48.900463+00	\N	\N
111	103	1	presi light gr 	1	200	0	200	2026-03-30 02:06:48.302683+00	\N	\N
112	104	1	presi light gr 	1	200	0	200	2026-03-30 02:15:15.083029+00	\N	\N
113	105	3	presi normal peq	3	150	0	450	2026-03-30 02:17:49.802062+00	\N	\N
114	106	3	presi normal peq	3	150	0	450	2026-03-30 02:20:17.881453+00	\N	\N
115	106	1	presi light gr 	1	200	0	200	2026-03-30 02:20:17.881453+00	\N	\N
116	107	6	one peq	1	125	0	125	2026-03-30 02:29:41.583833+00	\N	\N
117	108	1	presi light gr 	1	200	0	200	2026-03-30 02:35:16.912208+00	\N	\N
118	109	1	presi light gr 	1	200	0	200	2026-03-30 02:35:30.513447+00	\N	\N
119	110	47	Doble reserva pq	1	750	0	750	2026-03-30 02:58:37.220638+00	\N	\N
120	111	1	presi light gr 	1	200	0	200	2026-03-30 02:59:49.917217+00	\N	\N
121	112	1	presi light gr 	1	200	0	200	2026-03-30 03:20:12.081557+00	\N	\N
122	112	3	presi normal peq	1	150	0	150	2026-03-30 03:20:12.081557+00	\N	\N
123	113	3	presi normal peq	2	150	0	300	2026-03-30 03:39:25.271611+00	\N	\N
124	113	4	presi light peq	2	150	0	300	2026-03-30 03:39:25.271611+00	\N	\N
125	114	1	presi light gr 	1	200	0	200	2026-03-30 04:01:16.010962+00	\N	\N
126	115	3	presi normal peq	1	150	0	150	2026-03-30 04:15:04.874153+00	\N	\N
127	116	1	presi light gr 	2	200	0	400	2026-03-30 04:16:24.567469+00	\N	\N
128	117	1	presi light gr 	2	200	0	400	2026-03-30 04:17:35.14268+00	\N	\N
129	118	2	presi normal gr	1	200	0	200	2026-03-30 21:48:22.046624+00	\N	\N
130	119	2	presi normal gr	1	200	0	200	2026-03-30 21:57:16.156485+00	\N	\N
131	120	1	presi light gr 	2	200	0	400	2026-03-30 22:19:32.611786+00	\N	\N
132	120	4	presi light peq	1	150	0	150	2026-03-30 22:19:32.611786+00	\N	\N
133	121	1	presi light gr 	2	200	0	400	2026-03-31 00:25:48.864355+00	\N	\N
134	122	1	presi light gr 	3	200	0	600	2026-03-31 01:26:42.270665+00	\N	\N
135	122	2	presi normal gr	1	200	0	200	2026-03-31 01:26:42.270665+00	\N	\N
136	123	2	presi normal gr	1	200	0	200	2026-03-31 01:38:05.836643+00	\N	\N
137	124	1	presi light gr 	2	200	0	400	2026-03-31 01:58:15.498213+00	\N	\N
138	125	2	presi normal gr	6	200	0	1200	2026-03-31 02:49:00.398566+00	\N	\N
139	126	2	presi normal gr	2	200	0	400	2026-03-31 02:50:24.595634+00	\N	\N
140	126	1	presi light gr 	1	200	0	200	2026-03-31 02:50:24.595634+00	\N	\N
141	127	2	presi normal gr	1	200	0	200	2026-03-31 22:06:21.441063+00	\N	\N
142	128	2	presi normal gr	1	200	0	200	2026-03-31 22:06:32.649695+00	\N	\N
143	129	4	presi light peq	1	150	0	150	2026-03-31 22:06:47.786175+00	\N	\N
144	130	4	presi light peq	2	150	0	300	2026-03-31 22:35:10.707724+00	\N	\N
145	130	3	presi normal peq	3	150	0	450	2026-03-31 22:35:10.707724+00	\N	\N
146	131	2	presi normal gr	1	200	0	200	2026-03-31 22:42:41.119798+00	\N	\N
147	132	1	presi light gr 	1	200	0	200	2026-03-31 23:05:01.595197+00	\N	\N
148	133	1	presi light gr 	1	200	0	200	2026-03-31 23:26:05.894008+00	\N	\N
149	134	1	presi light gr 	2	200	0	400	2026-03-31 23:26:49.273894+00	\N	\N
150	134	2	presi normal gr	1	200	0	200	2026-03-31 23:26:49.273894+00	\N	\N
151	135	1	presi light gr 	1	200	0	200	2026-03-31 23:56:48.9753+00	\N	\N
152	136	1	presi light gr 	1	200	0	200	2026-04-01 00:36:02.68032+00	\N	\N
153	137	1	presi light gr 	2	200	0	400	2026-04-01 00:48:47.189008+00	\N	\N
154	138	1	presi light gr 	1	200	0	200	2026-04-01 01:03:39.76073+00	\N	\N
155	139	1	presi light gr 	1	200	0	200	2026-04-01 01:25:18.392929+00	\N	\N
156	140	1	presi light gr 	1	200	0	200	2026-04-01 01:48:25.421892+00	\N	\N
157	141	2	presi normal gr	1	200	0	200	2026-04-01 02:00:15.171163+00	\N	\N
158	142	4	presi light peq	1	150	0	150	2026-04-01 02:02:11.072897+00	\N	\N
159	143	2	presi normal gr	1	200	0	200	2026-04-01 02:12:23.182318+00	\N	\N
160	144	1	presi light gr 	2	200	0	400	2026-04-01 02:22:04.048607+00	\N	\N
161	145	1	presi light gr 	1	200	0	200	2026-04-01 02:35:09.317754+00	\N	\N
162	145	2	presi normal gr	1	200	0	200	2026-04-01 02:35:09.317754+00	\N	\N
163	146	1	presi light gr 	1	200	0	200	2026-04-01 02:43:28.414398+00	\N	\N
164	147	2	presi normal gr	2	200	0	400	2026-04-01 03:07:11.778131+00	\N	\N
165	148	1	presi light gr 	1	200	0	200	2026-04-01 03:19:57.784877+00	\N	\N
166	149	1	presi light gr 	1	200	0	200	2026-04-01 03:38:07.297066+00	\N	\N
167	150	1	presi light gr 	1	200	0	200	2026-04-01 03:45:43.087994+00	\N	\N
168	151	1	presi light gr 	1	200	0	200	2026-04-01 04:03:58.932746+00	\N	\N
169	151	2	presi normal gr	5	200	0	1000	2026-04-01 04:03:58.932746+00	\N	\N
170	152	2	presi normal gr	1	200	0	200	2026-04-01 04:06:29.25875+00	\N	\N
171	153	4	presi light peq	5	150	0	750	2026-04-01 04:06:55.08762+00	\N	\N
172	154	1	presi light gr 	1	200	0	200	2026-04-01 04:08:06.979929+00	\N	\N
173	155	2	presi normal gr	3	200	0	600	2026-04-01 04:11:16.310627+00	\N	\N
174	156	4	presi light peq	1	150	0	150	2026-04-01 04:12:36.279532+00	\N	\N
175	157	13	911	1	100	0	100	2026-04-01 04:17:02.470266+00	\N	\N
176	158	13	911	1	100	0	100	2026-04-01 04:17:23.178955+00	\N	\N
177	159	1	presi light gr 	1	200	0	200	2026-04-01 22:28:06.006979+00	\N	\N
178	160	1	presi light gr 	1	200	0	200	2026-04-01 22:28:53.521477+00	\N	\N
179	161	1	presi light gr 	1	200	0	200	2026-04-01 22:41:31.227217+00	\N	\N
180	162	2	presi normal gr	1	200	0	200	2026-04-01 22:52:42.969225+00	\N	\N
181	163	1	presi light gr 	2	200	0	400	2026-04-01 22:58:23.064555+00	\N	\N
182	164	2	presi normal gr	1	200	0	200	2026-04-01 23:01:49.047586+00	\N	\N
183	165	1	presi light gr 	1	200	0	200	2026-04-01 23:02:29.510323+00	\N	\N
184	166	2	presi normal gr	2	200	0	400	2026-04-01 23:16:11.692773+00	\N	\N
185	167	1	presi light gr 	3	200	0	600	2026-04-01 23:17:33.522028+00	\N	\N
186	168	1	presi light gr 	1	200	0	200	2026-04-01 23:19:15.026246+00	\N	\N
187	169	3	presi normal peq	1	150	0	150	2026-04-01 23:42:35.517679+00	\N	\N
188	170	2	presi normal gr	1	200	0	200	2026-04-01 23:46:44.440637+00	\N	\N
189	171	1	presi light gr 	1	200	0	200	2026-04-01 23:51:17.100205+00	\N	\N
190	172	2	presi normal gr	1	200	0	200	2026-04-01 23:54:28.565761+00	\N	\N
191	173	1	presi light gr 	2	200	0	400	2026-04-02 00:08:50.318723+00	\N	\N
192	174	2	presi normal gr	1	200	0	200	2026-04-02 00:09:37.206274+00	\N	\N
193	175	1	presi light gr 	1	200	0	200	2026-04-02 00:21:26.314923+00	\N	\N
194	176	4	presi light peq	1	150	0	150	2026-04-02 00:22:27.708602+00	\N	\N
195	177	8	modelo peq	1	200	0	200	2026-04-02 00:28:27.90931+00	\N	\N
196	178	2	presi normal gr	2	200	0	400	2026-04-02 00:35:37.859971+00	\N	\N
197	179	2	presi normal gr	1	200	0	200	2026-04-02 01:01:40.961435+00	\N	\N
198	180	2	presi normal gr	1	200	0	200	2026-04-02 01:02:24.240613+00	\N	\N
199	181	2	presi normal gr	1	200	0	200	2026-04-02 01:08:24.542828+00	\N	\N
200	182	2	presi normal gr	1	200	0	200	2026-04-02 01:13:42.639009+00	\N	\N
201	183	3	presi normal peq	1	150	0	150	2026-04-02 01:23:37.400718+00	\N	\N
202	184	2	presi normal gr	1	200	0	200	2026-04-02 01:27:07.148213+00	\N	\N
203	185	4	presi light peq	1	150	0	150	2026-04-02 01:35:31.071263+00	\N	\N
204	186	1	presi light gr 	1	200	0	200	2026-04-02 01:35:58.562593+00	\N	\N
205	187	2	presi normal gr	1	200	0	200	2026-04-02 01:46:36.028991+00	\N	\N
206	188	2	presi normal gr	1	200	0	200	2026-04-02 01:50:36.367555+00	\N	\N
207	189	3	presi normal peq	1	150	0	150	2026-04-02 02:02:16.348768+00	\N	\N
208	190	2	presi normal gr	1	200	0	200	2026-04-02 02:03:12.732968+00	\N	\N
209	191	2	presi normal gr	1	200	0	200	2026-04-02 02:04:20.108453+00	\N	\N
210	192	2	presi normal gr	1	200	0	200	2026-04-02 02:05:35.765644+00	\N	\N
211	193	2	presi normal gr	2	200	0	400	2026-04-02 02:07:23.04266+00	\N	\N
212	194	2	presi normal gr	1	200	0	200	2026-04-02 02:20:09.435082+00	\N	\N
213	195	2	presi normal gr	1	200	0	200	2026-04-02 02:20:10.636152+00	\N	\N
214	196	2	presi normal gr	2	200	0	400	2026-04-02 02:32:43.078566+00	\N	\N
215	196	4	presi light peq	1	150	0	150	2026-04-02 02:32:43.078566+00	\N	\N
216	197	2	presi normal gr	1	200	0	200	2026-04-02 02:47:00.522635+00	\N	\N
217	198	1	presi light gr 	1	200	0	200	2026-04-02 02:47:59.031077+00	\N	\N
218	199	3	presi normal peq	1	150	0	150	2026-04-02 02:49:21.112524+00	\N	\N
219	200	3	presi normal peq	1	150	0	150	2026-04-02 03:10:38.482166+00	\N	\N
220	200	1	presi light gr 	1	200	0	200	2026-04-02 03:10:38.482166+00	\N	\N
221	201	1	presi light gr 	1	200	0	200	2026-04-02 03:17:05.784123+00	\N	\N
222	202	1	presi light gr 	1	200	0	200	2026-04-02 03:19:12.765489+00	\N	\N
223	203	2	presi normal gr	6	200	0	1200	2026-04-02 03:48:30.874132+00	\N	\N
224	203	35	Doble reserva	1	1500	0	1500	2026-04-02 03:48:30.874132+00	\N	\N
225	203	14	jugo motts	1	300	0	300	2026-04-02 03:48:30.874132+00	\N	\N
226	204	2	presi normal gr	2	200	0	400	2026-04-02 03:54:56.626683+00	\N	\N
227	205	56	Clorets	1	15	0	15	2026-04-02 21:15:04.800953+00	\N	\N
228	206	1	presi light gr 	1	200	0	200	2026-04-02 21:47:46.356403+00	\N	\N
229	207	1	presi light gr 	1	200	0	200	2026-04-02 22:04:18.606558+00	\N	\N
230	208	1	presi light gr 	3	200	0	600	2026-04-02 22:18:44.04037+00	\N	\N
231	209	1	presi light gr 	3	200	0	600	2026-04-02 22:48:21.315701+00	\N	\N
232	210	2	presi normal gr	1	200	0	200	2026-04-02 22:48:58.201669+00	\N	\N
233	211	2	presi normal gr	1	200	0	200	2026-04-02 23:06:45.4761+00	\N	\N
234	212	1	presi light gr 	2	200	0	400	2026-04-02 23:07:32.608601+00	\N	\N
235	213	2	presi normal gr	1	200	0	200	2026-04-02 23:12:36.45697+00	\N	\N
236	214	4	presi light peq	1	150	0	150	2026-04-02 23:13:12.844941+00	\N	\N
237	215	1	presi light gr 	1	200	0	200	2026-04-02 23:20:30.431551+00	\N	\N
238	216	1	presi light gr 	1	200	0	200	2026-04-02 23:21:00.894826+00	\N	\N
239	217	2	presi normal gr	1	200	0	200	2026-04-02 23:37:33.688908+00	\N	\N
240	218	1	presi light gr 	2	200	0	400	2026-04-02 23:41:17.871574+00	\N	\N
241	219	1	presi light gr 	1	200	0	200	2026-04-03 00:05:09.215876+00	\N	\N
242	220	51	Agua maria	1	50	0	50	2026-04-03 00:05:31.407694+00	\N	\N
243	221	56	Clorets	1	15	0	15	2026-04-03 00:15:01.700304+00	\N	\N
244	222	2	presi normal gr	1	200	0	200	2026-04-03 00:24:55.9954+00	\N	\N
245	223	2	presi normal gr	1	200	0	200	2026-04-03 00:28:34.662912+00	\N	\N
246	224	1	presi light gr 	1	200	0	200	2026-04-03 00:35:04.453236+00	\N	\N
247	225	1	presi light gr 	2	200	0	400	2026-04-03 00:38:47.630203+00	\N	\N
248	226	4	presi light peq	1	150	0	150	2026-04-03 00:41:37.526154+00	\N	\N
249	227	1	presi light gr 	1	200	0	200	2026-04-03 00:53:15.591442+00	\N	\N
250	228	2	presi normal gr	1	200	0	200	2026-04-03 00:55:10.577863+00	\N	\N
251	229	55	Trident 	1	50	0	50	2026-04-03 01:05:27.912818+00	\N	\N
252	230	6	one peq	1	150	0	150	2026-04-03 01:05:56.157691+00	\N	\N
253	230	4	presi light peq	1	150	0	150	2026-04-03 01:05:56.157691+00	\N	\N
254	231	4	presi light peq	1	150	0	150	2026-04-03 01:06:23.570178+00	\N	\N
255	232	2	presi normal gr	1	200	0	200	2026-04-03 01:12:25.962373+00	\N	\N
256	233	1	presi light gr 	2	200	0	400	2026-04-03 01:15:02.299885+00	\N	\N
257	234	2	presi normal gr	2	200	0	400	2026-04-03 01:21:08.072243+00	\N	\N
258	235	1	presi light gr 	2	200	0	400	2026-04-03 01:23:46.20734+00	\N	\N
259	235	2	presi normal gr	1	200	0	200	2026-04-03 01:23:46.20734+00	\N	\N
260	236	1	presi light gr 	1	200	0	200	2026-04-03 01:26:05.774381+00	\N	\N
261	237	1	presi light gr 	1	200	0	200	2026-04-03 01:26:36.859472+00	\N	\N
262	238	2	presi normal gr	1	200	0	200	2026-04-03 01:29:57.703955+00	\N	\N
263	239	2	presi normal gr	1	200	0	200	2026-04-03 01:33:23.087239+00	\N	\N
264	240	2	presi normal gr	1	200	0	200	2026-04-03 01:39:12.921352+00	\N	\N
265	241	2	presi normal gr	4	200	0	800	2026-04-03 01:42:46.288038+00	\N	\N
266	242	1	presi light gr 	2	200	0	400	2026-04-03 01:47:06.813125+00	\N	\N
267	243	2	presi normal gr	1	200	0	200	2026-04-03 01:50:43.406348+00	\N	\N
268	244	1	presi light gr 	1	200	0	200	2026-04-03 01:52:10.365843+00	\N	\N
269	245	1	presi light gr 	2	200	0	400	2026-04-03 01:54:42.525421+00	\N	\N
270	246	1	presi light gr 	2	200	0	400	2026-04-03 01:55:10.955534+00	\N	\N
271	247	2	presi normal gr	1	200	0	200	2026-04-03 02:00:43.999781+00	\N	\N
272	248	2	presi normal gr	3	200	0	600	2026-04-03 02:03:07.306392+00	\N	\N
273	249	2	presi normal gr	5	200	0	1000	2026-04-03 02:04:19.132687+00	\N	\N
274	249	55	Trident 	1	50	0	50	2026-04-03 02:04:19.132687+00	\N	\N
275	250	1	presi light gr 	1	200	0	200	2026-04-03 02:05:29.494515+00	\N	\N
276	251	2	presi normal gr	1	200	0	200	2026-04-03 02:15:05.395001+00	\N	\N
277	252	1	presi light gr 	1	200	0	200	2026-04-03 02:15:35.006497+00	\N	\N
278	253	2	presi normal gr	1	200	0	200	2026-04-03 02:17:04.882285+00	\N	\N
279	254	2	presi normal gr	1	200	0	200	2026-04-03 02:20:09.842913+00	\N	\N
280	255	2	presi normal gr	2	200	0	400	2026-04-03 02:20:36.679907+00	\N	\N
281	256	30	kings pride	3	200	0	600	2026-04-03 02:23:35.640002+00	\N	\N
282	257	2	presi normal gr	1	200	0	200	2026-04-03 02:35:04.20611+00	\N	\N
283	258	2	presi normal gr	1	200	0	200	2026-04-03 02:42:53.144321+00	\N	\N
284	259	2	presi normal gr	3	200	0	600	2026-04-03 03:19:27.3028+00	\N	\N
285	260	53	Smirnoff	2	225	0	450	2026-04-03 03:23:31.919425+00	\N	\N
286	260	2	presi normal gr	2	200	0	400	2026-04-03 03:23:31.919425+00	\N	\N
287	260	30	kings pride	1	200	0	200	2026-04-03 03:23:31.919425+00	\N	\N
288	261	3	presi normal peq	1	150	0	150	2026-04-04 19:35:03.049786+00	\N	\N
289	262	3	presi normal peq	1	150	0	150	2026-04-04 19:35:03.767533+00	\N	\N
290	263	3	presi normal peq	1	150	0	150	2026-04-04 19:35:04.679321+00	\N	\N
291	264	3	presi normal peq	1	150	0	150	2026-04-04 19:35:05.261317+00	\N	\N
292	265	1	presi light gr 	2	200	0	400	2026-04-04 20:49:06.990018+00	\N	\N
293	266	1	presi light gr 	2	200	0	400	2026-04-04 20:49:08.39263+00	\N	\N
294	267	1	presi light gr 	1	200	0	200	2026-04-04 21:17:58.737202+00	\N	\N
295	268	1	presi light gr 	1	200	0	200	2026-04-04 21:45:13.330218+00	\N	\N
296	269	1	presi light gr 	1	200	0	200	2026-04-04 21:46:34.333751+00	\N	\N
297	270	4	presi light peq	1	150	0	150	2026-04-04 22:04:11.631821+00	\N	\N
298	271	1	presi light gr 	1	200	0	200	2026-04-04 22:18:06.600131+00	\N	\N
299	272	4	presi light peq	1	150	0	150	2026-04-04 22:20:53.173661+00	\N	\N
300	272	1	presi light gr 	1	200	0	200	2026-04-04 22:20:53.173661+00	\N	\N
301	272	30	kings pride	2	200	0	400	2026-04-04 22:20:53.173661+00	\N	\N
302	273	1	presi light gr 	1	200	0	200	2026-04-04 22:27:31.006174+00	\N	\N
303	274	4	presi light peq	1	150	0	150	2026-04-04 22:28:20.007104+00	\N	\N
304	275	1	presi light gr 	1	200	0	200	2026-04-04 22:29:01.117179+00	\N	\N
305	276	1	presi light gr 	1	200	0	200	2026-04-04 22:29:20.678847+00	\N	\N
306	277	1	presi light gr 	1	200	0	200	2026-04-04 22:42:54.085512+00	\N	\N
307	278	1	presi light gr 	1	200	0	200	2026-04-04 22:43:20.947722+00	\N	\N
308	279	1	presi light gr 	1	200	0	200	2026-04-04 22:58:53.754318+00	\N	\N
309	280	55	Trident 	1	50	0	50	2026-04-04 23:05:00.289918+00	\N	\N
310	281	56	Clorets	1	15	0	15	2026-04-04 23:08:10.275607+00	\N	\N
311	282	1	presi light gr 	4	200	0	800	2026-04-04 23:15:23.265326+00	\N	\N
312	283	1	presi light gr 	1	200	0	200	2026-04-04 23:15:43.542575+00	\N	\N
313	284	30	kings pride	1	200	0	200	2026-04-04 23:18:14.05171+00	\N	\N
314	285	1	presi light gr 	1	200	0	200	2026-04-04 23:21:32.549007+00	\N	\N
315	286	1	presi light gr 	1	200	0	200	2026-04-04 23:26:36.882567+00	\N	\N
316	287	1	presi light gr 	1	200	0	200	2026-04-04 23:28:35.569514+00	\N	\N
317	288	1	presi light gr 	1	200	0	200	2026-04-04 23:38:40.128497+00	\N	\N
318	289	1	presi light gr 	1	200	0	200	2026-04-04 23:47:35.354055+00	\N	\N
319	290	1	presi light gr 	1	200	0	200	2026-04-04 23:53:45.102394+00	\N	\N
320	291	1	presi light gr 	2	200	0	400	2026-04-05 00:02:28.703703+00	\N	\N
321	292	1	presi light gr 	1	200	0	200	2026-04-05 00:04:07.680671+00	\N	\N
322	293	1	presi light gr 	1	200	0	200	2026-04-05 00:07:08.882517+00	\N	\N
323	294	1	presi light gr 	1	200	0	200	2026-04-05 00:18:26.426313+00	\N	\N
324	295	1	presi light gr 	1	200	0	200	2026-04-05 00:25:13.079649+00	\N	\N
325	296	1	presi light gr 	2	200	0	400	2026-04-05 00:26:16.294373+00	\N	\N
326	297	30	kings pride	1	200	0	200	2026-04-05 00:26:45.959852+00	\N	\N
327	298	1	presi light gr 	1	200	0	200	2026-04-05 00:31:35.499201+00	\N	\N
328	299	30	kings pride	2	200	0	400	2026-04-05 00:40:31.07459+00	\N	\N
329	299	3	presi normal peq	3	150	0	450	2026-04-05 00:40:31.07459+00	\N	\N
330	299	10	rell bull	2	200	0	400	2026-04-05 00:40:31.07459+00	\N	\N
331	299	1	presi light gr 	10	200	0	2000	2026-04-05 00:40:31.07459+00	\N	\N
332	299	4	presi light peq	3	150	0	450	2026-04-05 00:40:31.07459+00	\N	\N
333	300	1	presi light gr 	1	200	0	200	2026-04-05 00:43:43.111705+00	\N	\N
334	301	1	presi light gr 	1	200	0	200	2026-04-05 00:46:55.774078+00	\N	\N
335	302	1	presi light gr 	1	200	0	200	2026-04-05 00:51:09.004549+00	\N	\N
336	303	1	presi light gr 	2	200	0	400	2026-04-05 00:53:53.91683+00	\N	\N
337	304	1	presi light gr 	1	200	0	200	2026-04-05 00:56:17.111757+00	\N	\N
338	305	1	presi light gr 	2	200	0	400	2026-04-05 00:56:42.242679+00	\N	\N
339	305	30	kings pride	1	200	0	200	2026-04-05 00:56:42.242679+00	\N	\N
340	306	1	presi light gr 	1	200	0	200	2026-04-05 00:57:13.51335+00	\N	\N
341	307	1	presi light gr 	1	200	0	200	2026-04-05 01:01:07.005742+00	\N	\N
342	308	51	Agua maria	1	50	0	50	2026-04-05 01:02:33.650857+00	\N	\N
343	309	1	presi light gr 	2	200	0	400	2026-04-05 01:09:19.498876+00	\N	\N
344	310	1	presi light gr 	1	200	0	200	2026-04-05 01:15:38.347693+00	\N	\N
345	311	1	presi light gr 	1	200	0	200	2026-04-05 01:17:18.917968+00	\N	\N
346	312	1	presi light gr 	1	200	0	200	2026-04-05 01:19:47.968069+00	\N	\N
347	313	1	presi light gr 	1	200	0	200	2026-04-05 01:21:23.751593+00	\N	\N
348	314	1	presi light gr 	1	200	0	200	2026-04-05 01:27:56.835471+00	\N	\N
349	315	1	presi light gr 	1	200	0	200	2026-04-05 01:28:46.435219+00	\N	\N
350	316	4	presi light peq	1	150	0	150	2026-04-05 01:30:48.462492+00	\N	\N
351	317	1	presi light gr 	1	200	0	200	2026-04-05 01:41:26.611559+00	\N	\N
352	318	1	presi light gr 	2	200	0	400	2026-04-05 01:41:54.180933+00	\N	\N
353	319	1	presi light gr 	2	200	0	400	2026-04-05 01:46:23.519872+00	\N	\N
354	320	1	presi light gr 	1	200	0	200	2026-04-05 01:49:11.334839+00	\N	\N
355	321	4	presi light peq	1	150	0	150	2026-04-05 01:50:56.707808+00	\N	\N
356	322	1	presi light gr 	1	200	0	200	2026-04-05 01:52:19.703046+00	\N	\N
357	323	1	presi light gr 	1	200	0	200	2026-04-05 02:10:29.832517+00	\N	\N
358	324	1	presi light gr 	1	200	0	200	2026-04-05 02:11:40.708185+00	\N	\N
359	325	1	presi light gr 	1	200	0	200	2026-04-05 02:12:22.708851+00	\N	\N
360	326	9	one gra	3	200	0	600	2026-04-05 02:20:50.552564+00	\N	\N
361	327	1	presi light gr 	2	200	0	400	2026-04-05 02:23:44.470802+00	\N	\N
362	328	1	presi light gr 	2	200	0	400	2026-04-05 02:40:44.746306+00	\N	\N
363	329	1	presi light gr 	1	200	0	200	2026-04-05 02:47:35.073012+00	\N	\N
364	330	2	presi normal gr	1	200	0	200	2026-04-05 02:50:01.166796+00	\N	\N
365	331	55	Trident 	1	50	0	50	2026-04-05 02:56:17.343847+00	\N	\N
366	332	1	presi light gr 	2	200	0	400	2026-04-05 02:56:40.404219+00	\N	\N
367	333	1	presi light gr 	1	200	0	200	2026-04-05 03:03:37.026255+00	\N	\N
368	334	1	presi light gr 	1	200	0	200	2026-04-05 03:09:40.116959+00	\N	\N
369	335	1	presi light gr 	1	200	0	200	2026-04-05 03:18:21.592361+00	\N	\N
370	336	1	presi light gr 	1	200	0	200	2026-04-05 03:24:34.337802+00	\N	\N
371	337	30	kings pride	1	200	0	200	2026-04-05 03:25:13.249755+00	\N	\N
372	337	55	Trident 	1	50	0	50	2026-04-05 03:25:13.249755+00	\N	\N
373	337	1	presi light gr 	11	200	0	2200	2026-04-05 03:25:13.249755+00	\N	\N
374	338	1	presi light gr 	7	200	0	1400	2026-04-05 03:32:43.14428+00	\N	\N
375	339	2	presi normal gr	1	200	0	200	2026-04-05 03:37:20.145203+00	\N	\N
376	340	1	presi light gr 	2	200	0	400	2026-04-05 03:39:31.374337+00	\N	\N
377	340	51	Agua maria	1	50	0	50	2026-04-05 03:39:31.374337+00	\N	\N
378	341	2	presi normal gr	1	200	0	200	2026-04-05 03:40:17.543477+00	\N	\N
379	342	30	kings pride	1	200	0	200	2026-04-05 03:44:17.844537+00	\N	\N
380	343	1	presi light gr 	1	200	0	200	2026-04-05 03:44:37.960998+00	\N	\N
381	344	5	corona	3	200	0	600	2026-04-05 03:52:50.488673+00	\N	\N
382	345	2	presi normal gr	1	200	0	200	2026-04-05 03:53:28.423545+00	\N	\N
383	346	1	presi light gr 	1	200	0	200	2026-04-05 03:54:31.967776+00	\N	\N
384	347	1	presi light gr 	1	200	0	200	2026-04-05 03:55:52.929006+00	\N	\N
385	348	1	presi light gr 	1	200	0	200	2026-04-05 03:59:05.25266+00	\N	\N
386	349	1	presi light gr 	1	200	0	200	2026-04-05 04:10:03.698754+00	\N	\N
387	350	3	presi normal peq	1	150	0	150	2026-04-05 04:10:38.803398+00	\N	\N
388	351	1	presi light gr 	1	200	0	200	2026-04-05 04:17:46.912209+00	\N	\N
389	352	1	presi light gr 	1	200	0	200	2026-04-05 04:20:00.461916+00	\N	\N
390	353	2	presi normal gr	1	200	0	200	2026-04-05 04:27:48.399295+00	\N	\N
391	354	30	kings pride	1	200	0	200	2026-04-05 04:31:37.765366+00	\N	\N
392	355	1	presi light gr 	1	200	0	200	2026-04-05 04:35:35.068843+00	\N	\N
393	356	1	presi light gr 	3	200	0	600	2026-04-05 04:39:42.908054+00	\N	\N
394	357	1	presi light gr 	1	200	0	200	2026-04-05 04:48:10.593382+00	\N	\N
395	358	9	one gra	1	200	0	200	2026-04-05 05:11:28.014393+00	\N	\N
396	358	1	presi light gr 	1	200	0	200	2026-04-05 05:11:28.014393+00	\N	\N
397	358	2	presi normal gr	2	200	0	400	2026-04-05 05:11:28.014393+00	\N	\N
398	359	12	seven up	1	50	0	50	2026-04-05 05:32:00.546804+00	\N	\N
399	360	30	kings pride	1	200	0	200	2026-04-05 05:42:25.549711+00	\N	\N
400	360	9	one gra	1	200	0	200	2026-04-05 05:42:25.549711+00	\N	\N
401	360	1	presi light gr 	4	200	0	800	2026-04-05 05:42:25.549711+00	\N	\N
402	360	2	presi normal gr	4	200	0	800	2026-04-05 05:42:25.549711+00	\N	\N
403	361	1	presi light gr 	2	200	0	400	2026-04-05 05:43:52.825194+00	\N	\N
404	362	2	presi normal gr	6	200	0	1200	2026-04-05 23:45:20.056661+00	\N	\N
405	363	2	presi normal gr	1	200	0	200	2026-04-06 00:45:19.036279+00	\N	\N
406	364	2	presi normal gr	1	200	0	200	2026-04-06 00:49:14.345308+00	\N	\N
407	365	1	presi light gr 	1	200	0	200	2026-04-06 01:02:12.218394+00	\N	\N
408	366	56	Clorets	1	15	0	15	2026-04-06 01:28:29.127252+00	\N	\N
409	367	2	presi normal gr	2	200	0	400	2026-04-06 01:59:08.674907+00	\N	\N
410	368	2	presi normal gr	1	200	0	200	2026-04-06 02:13:13.00776+00	\N	\N
411	369	2	presi normal gr	4	200	0	800	2026-04-06 02:43:57.234351+00	\N	\N
412	370	12	seven up	1	50	0	50	2026-04-06 21:20:17.649858+00	\N	\N
413	371	2	presi normal gr	1	200	0	200	2026-04-06 23:42:27.444875+00	\N	\N
414	372	1	presi light gr 	1	200	0	200	2026-04-06 23:42:41.401666+00	\N	\N
415	373	1	presi light gr 	1	200	0	200	2026-04-07 00:00:21.595474+00	\N	\N
416	374	2	presi normal gr	1	200	0	200	2026-04-07 00:09:26.739488+00	\N	\N
417	375	2	presi normal gr	1	200	0	200	2026-04-07 00:16:40.830888+00	\N	\N
418	376	2	presi normal gr	1	200	0	200	2026-04-07 00:29:30.537452+00	\N	\N
419	377	2	presi normal gr	1	200	0	200	2026-04-07 00:39:56.866877+00	\N	\N
420	378	2	presi normal gr	1	200	0	200	2026-04-07 01:12:09.089059+00	\N	\N
421	379	2	presi normal gr	1	200	0	200	2026-04-07 01:35:04.726551+00	\N	\N
422	380	2	presi normal gr	1	200	0	200	2026-04-07 01:48:22.818986+00	\N	\N
423	381	2	presi normal gr	2	200	0	400	2026-04-07 02:15:16.235163+00	\N	\N
424	382	2	presi normal gr	1	200	0	200	2026-04-07 02:34:03.862881+00	\N	\N
425	383	2	presi normal gr	1	200	0	200	2026-04-07 02:34:05.322186+00	\N	\N
426	384	2	presi normal gr	1	200	0	200	2026-04-07 03:08:21.42007+00	\N	\N
427	384	1	presi light gr 	1	200	0	200	2026-04-07 03:08:21.42007+00	\N	\N
428	385	1	presi light gr 	1	200	0	200	2026-04-07 03:08:39.3167+00	\N	\N
429	386	2	presi normal gr	1	200	0	200	2026-04-07 03:09:06.248528+00	\N	\N
430	387	2	presi normal gr	1	200	0	200	2026-04-07 03:22:05.56051+00	\N	\N
431	388	2	presi normal gr	1	200	0	200	2026-04-07 03:34:44.73089+00	\N	\N
432	389	2	presi normal gr	2	200	0	400	2026-04-09 00:32:15.75684+00	\N	\N
433	390	2	presi normal gr	1	200	0	200	2026-04-09 00:43:29.585725+00	\N	\N
434	391	2	presi normal gr	1	200	0	200	2026-04-09 00:44:24.537984+00	\N	\N
435	392	1	presi light gr 	1	200	0	200	2026-04-09 00:57:16.356067+00	\N	\N
436	393	2	presi normal gr	1	200	0	200	2026-04-09 00:57:47.40318+00	\N	\N
437	394	33	añejo gr	1	1100	0	1100	2026-04-09 01:15:55.947206+00	\N	\N
438	394	14	jugo motts	1	300	0	300	2026-04-09 01:15:55.947206+00	\N	\N
439	395	1	presi light gr 	1	200	0	200	2026-04-09 01:17:43.789231+00	\N	\N
440	396	13	911	1	100	0	100	2026-04-09 01:24:09.854332+00	\N	\N
441	396	1	presi light gr 	1	200	0	200	2026-04-09 01:24:09.854332+00	\N	\N
442	397	1	presi light gr 	1	200	0	200	2026-04-09 01:50:40.108253+00	\N	\N
443	398	30	kings pride	1	200	0	200	2026-04-09 02:17:43.569474+00	\N	\N
444	398	1	presi light gr 	1	200	0	200	2026-04-09 02:17:43.569474+00	\N	\N
445	399	1	presi light gr 	1	200	0	200	2026-04-09 02:40:02.541519+00	\N	\N
446	400	3	presi normal peq	1	150	0	150	2026-04-09 02:51:49.604258+00	\N	\N
447	401	33	añejo gr	1	1100	0	1100	2026-04-09 03:30:24.048648+00	\N	\N
448	401	14	jugo motts	1	300	0	300	2026-04-09 03:30:24.048648+00	\N	\N
449	402	1	presi light gr 	1	200	0	200	2026-04-09 03:34:11.078021+00	\N	\N
450	403	2	presi normal gr	3	200	0	600	2026-04-09 22:08:30.206192+00	\N	\N
451	404	1	presi light gr 	1	200	0	200	2026-04-09 23:13:01.556584+00	\N	\N
452	404	2	presi normal gr	1	200	0	200	2026-04-09 23:13:01.556584+00	\N	\N
453	405	1	presi light gr 	1	200	0	200	2026-04-09 23:35:50.546387+00	\N	\N
454	406	1	presi light gr 	1	200	0	200	2026-04-09 23:58:46.123788+00	\N	\N
455	407	2	presi normal gr	1	200	0	200	2026-04-10 00:35:17.467874+00	\N	\N
456	408	3	presi normal peq	1	150	0	150	2026-04-10 00:38:19.685245+00	\N	\N
457	409	2	presi normal gr	2	200	0	400	2026-04-10 00:46:47.099174+00	\N	\N
458	410	2	presi normal gr	1	200	0	200	2026-04-10 01:01:07.993776+00	\N	\N
459	411	2	presi normal gr	2	200	0	400	2026-04-10 01:06:12.600653+00	\N	\N
460	412	2	presi normal gr	5	200	0	1000	2026-04-10 01:26:01.519791+00	\N	\N
461	413	2	presi normal gr	1	200	0	200	2026-04-10 01:29:17.242236+00	\N	\N
462	414	2	presi normal gr	1	200	0	200	2026-04-10 01:39:18.713099+00	\N	\N
463	415	1	presi light gr 	1	200	0	200	2026-04-10 01:51:45.506382+00	\N	\N
464	416	2	presi normal gr	2	200	0	400	2026-04-10 02:00:07.480397+00	\N	\N
465	417	1	presi light gr 	1	200	0	200	2026-04-10 02:17:17.316751+00	\N	\N
466	418	2	presi normal gr	1	200	0	200	2026-04-10 02:31:07.985449+00	\N	\N
467	419	1	presi light gr 	1	200	0	200	2026-04-10 02:45:48.505888+00	\N	\N
468	420	2	presi normal gr	1	200	0	200	2026-04-10 02:53:58.698301+00	\N	\N
469	421	2	presi normal gr	1	200	0	200	2026-04-10 21:29:17.333788+00	\N	\N
470	422	2	presi normal gr	1	200	0	200	2026-04-10 22:20:33.690225+00	\N	\N
471	423	2	presi normal gr	2	200	0	400	2026-04-10 22:47:57.146378+00	\N	\N
472	424	34	añejo peq	1	600	0	600	2026-04-11 00:16:09.981529+00	\N	\N
473	425	2	presi normal gr	1	200	0	200	2026-04-11 00:20:58.209758+00	\N	\N
474	426	2	presi normal gr	1	200	0	200	2026-04-11 00:41:12.850468+00	\N	\N
475	427	1	presi light gr 	1	200	0	200	2026-04-11 00:44:57.693413+00	\N	\N
476	428	55	Trident 	1	50	0	50	2026-04-11 00:52:32.712314+00	\N	\N
477	429	51	Agua maria	1	50	0	50	2026-04-11 00:55:21.245901+00	\N	\N
478	430	1	presi light gr 	1	200	0	200	2026-04-11 01:09:45.601171+00	\N	\N
479	430	2	presi normal gr	1	200	0	200	2026-04-11 01:09:45.601171+00	\N	\N
480	431	1	presi light gr 	1	200	0	200	2026-04-11 01:14:09.19575+00	\N	\N
481	432	2	presi normal gr	2	200	0	400	2026-04-11 01:20:34.551528+00	\N	\N
482	433	53	Smirnoff	1	225	0	225	2026-04-11 01:22:02.115576+00	\N	\N
483	434	2	presi normal gr	1	200	0	200	2026-04-11 01:22:49.369708+00	\N	\N
484	435	34	añejo peq	1	600	0	600	2026-04-11 01:23:42.803618+00	\N	\N
485	436	1	presi light gr 	1	200	0	200	2026-04-11 01:31:12.642348+00	\N	\N
486	437	2	presi normal gr	1	200	0	200	2026-04-11 01:32:18.849803+00	\N	\N
487	438	2	presi normal gr	1	200	0	200	2026-04-11 01:42:34.012955+00	\N	\N
488	439	1	presi light gr 	1	200	0	200	2026-04-11 01:56:02.552507+00	\N	\N
489	440	2	presi normal gr	1	200	0	200	2026-04-11 01:58:43.175918+00	\N	\N
490	441	2	presi normal gr	1	200	0	200	2026-04-11 02:21:39.893601+00	\N	\N
491	442	1	presi light gr 	1	200	0	200	2026-04-11 02:33:18.574929+00	\N	\N
492	443	2	presi normal gr	1	200	0	200	2026-04-11 02:38:17.042152+00	\N	\N
493	443	1	presi light gr 	1	200	0	200	2026-04-11 02:38:17.042152+00	\N	\N
494	444	2	presi normal gr	1	200	0	200	2026-04-11 03:01:06.301528+00	\N	\N
495	445	1	presi light gr 	1	200	0	200	2026-04-11 03:11:19.89663+00	\N	\N
496	446	1	presi light gr 	1	200	0	200	2026-04-11 03:11:19.994109+00	\N	\N
497	447	1	presi light gr 	1	200	0	200	2026-04-11 03:53:20.038921+00	\N	\N
498	448	2	presi normal gr	2	200	0	400	2026-04-11 03:54:30.227853+00	\N	\N
499	449	5	corona	1	200	0	200	2026-04-11 20:33:49.646565+00	\N	\N
500	450	2	presi normal gr	1	200	0	200	2026-04-11 20:49:04.465315+00	\N	\N
501	451	2	presi normal gr	1	200	0	200	2026-04-11 20:56:17.387256+00	\N	\N
502	452	2	presi normal gr	1	200	0	200	2026-04-11 21:00:07.597701+00	\N	\N
503	453	2	presi normal gr	1	200	0	200	2026-04-11 21:03:36.434704+00	\N	\N
504	454	2	presi normal gr	1	200	0	200	2026-04-11 21:05:52.246036+00	\N	\N
505	455	1	presi light gr 	1	200	0	200	2026-04-11 21:09:03.020965+00	\N	\N
506	456	1	presi light gr 	1	200	0	200	2026-04-11 21:09:04.631516+00	\N	\N
507	457	1	presi light gr 	1	200	0	200	2026-04-11 21:10:18.716537+00	\N	\N
508	458	56	Clorets	2	15	0	30	2026-04-11 21:12:45.459555+00	\N	\N
509	459	2	presi normal gr	1	200	0	200	2026-04-11 21:14:27.564846+00	\N	\N
510	460	1	presi light gr 	1	200	0	200	2026-04-11 21:21:01.265934+00	\N	\N
511	461	1	presi light gr 	1	200	0	200	2026-04-11 21:31:18.762172+00	\N	\N
512	462	1	presi light gr 	1	200	0	200	2026-04-11 21:32:27.591219+00	\N	\N
513	463	55	Trident 	1	50	0	50	2026-04-11 21:40:57.075864+00	\N	\N
514	464	2	presi normal gr	1	200	0	200	2026-04-11 21:41:24.997231+00	\N	\N
515	465	2	presi normal gr	1	200	0	200	2026-04-11 21:42:47.021678+00	\N	\N
516	466	1	presi light gr 	1	200	0	200	2026-04-11 21:46:14.480612+00	\N	\N
517	467	1	presi light gr 	1	200	0	200	2026-04-11 21:47:26.710554+00	\N	\N
518	468	2	presi normal gr	1	200	0	200	2026-04-11 21:57:47.949802+00	\N	\N
519	469	2	presi normal gr	3	200	0	600	2026-04-11 21:59:04.206962+00	\N	\N
520	470	2	presi normal gr	1	200	0	200	2026-04-11 22:02:16.374103+00	\N	\N
521	471	2	presi normal gr	1	200	0	200	2026-04-11 22:19:29.561949+00	\N	\N
522	472	2	presi normal gr	1	200	0	200	2026-04-11 22:38:51.514749+00	\N	\N
523	473	2	presi normal gr	1	200	0	200	2026-04-11 23:00:33.554965+00	\N	\N
524	474	1	presi light gr 	1	200	0	200	2026-04-11 23:15:05.073388+00	\N	\N
525	475	2	presi normal gr	1	200	0	200	2026-04-11 23:20:16.328965+00	\N	\N
526	476	1	presi light gr 	1	200	0	200	2026-04-11 23:22:57.657803+00	\N	\N
527	477	1	presi light gr 	1	200	0	200	2026-04-11 23:35:34.421467+00	\N	\N
528	478	2	presi normal gr	2	200	0	400	2026-04-11 23:40:38.405251+00	\N	\N
529	479	2	presi normal gr	1	200	0	200	2026-04-11 23:42:19.930685+00	\N	\N
530	480	1	presi light gr 	1	200	0	200	2026-04-11 23:42:42.804641+00	\N	\N
531	481	2	presi normal gr	2	200	0	400	2026-04-11 23:57:30.170312+00	\N	\N
532	482	2	presi normal gr	2	200	0	400	2026-04-11 23:58:48.973961+00	\N	\N
533	483	2	presi normal gr	2	200	0	400	2026-04-12 00:13:17.543563+00	\N	\N
534	483	1	presi light gr 	1	200	0	200	2026-04-12 00:13:17.543563+00	\N	\N
535	484	2	presi normal gr	1	200	0	200	2026-04-12 00:15:08.635373+00	\N	\N
536	485	47	Doble reserva pq	1	750	0	750	2026-04-12 00:43:15.17244+00	\N	\N
537	485	14	jugo motts	1	300	0	300	2026-04-12 00:43:15.17244+00	\N	\N
538	485	12	seven up	1	50	0	50	2026-04-12 00:43:15.17244+00	\N	\N
539	485	10	rell bull	1	200	0	200	2026-04-12 00:43:15.17244+00	\N	\N
540	485	30	kings pride	1	200	0	200	2026-04-12 00:43:15.17244+00	\N	\N
541	485	2	presi normal gr	2	200	0	400	2026-04-12 00:43:15.17244+00	\N	\N
542	486	9	one gra	1	200	0	200	2026-04-12 20:27:40.323258+00	\N	\N
543	487	9	one gra	1	200	0	200	2026-04-12 20:38:36.526234+00	\N	\N
544	488	9	one gra	1	200	0	200	2026-04-12 20:41:16.00279+00	\N	\N
545	489	9	one gra	2	200	0	400	2026-04-12 20:57:48.85581+00	\N	\N
546	490	2	presi normal gr	1	200	0	200	2026-04-12 21:17:34.701441+00	\N	\N
547	491	9	one gra	1	200	0	200	2026-04-12 21:22:46.897997+00	\N	\N
548	492	2	presi normal gr	2	200	0	400	2026-04-12 21:27:00.450088+00	\N	\N
549	492	5	corona	1	200	0	200	2026-04-12 21:27:00.450088+00	\N	\N
550	493	5	corona	1	200	0	200	2026-04-12 21:29:41.31612+00	\N	\N
551	494	2	presi normal gr	2	200	0	400	2026-04-12 21:30:38.722732+00	\N	\N
552	495	9	one gra	1	200	0	200	2026-04-12 21:35:48.504084+00	\N	\N
553	496	9	one gra	1	200	0	200	2026-04-12 21:39:04.489444+00	\N	\N
554	497	1	presi light gr 	1	200	0	200	2026-04-12 22:01:45.485898+00	\N	\N
555	498	1	presi light gr 	1	200	0	200	2026-04-12 22:01:45.929726+00	\N	\N
556	499	9	one gra	1	200	0	200	2026-04-12 22:08:39.15243+00	\N	\N
557	499	5	corona	1	200	0	200	2026-04-12 22:08:39.15243+00	\N	\N
558	500	9	one gra	1	200	0	200	2026-04-12 22:14:06.535581+00	\N	\N
559	501	1	presi light gr 	1	200	0	200	2026-04-12 22:19:24.375193+00	\N	\N
560	502	9	one gra	1	200	0	200	2026-04-12 22:20:39.954908+00	\N	\N
561	503	2	presi normal gr	1	200	0	200	2026-04-12 22:27:51.084372+00	\N	\N
562	503	3	presi normal peq	1	150	0	150	2026-04-12 22:27:51.084372+00	\N	\N
563	504	1	presi light gr 	1	200	0	200	2026-04-12 22:40:39.543328+00	\N	\N
564	505	1	presi light gr 	1	200	0	200	2026-04-12 22:49:15.065723+00	\N	\N
565	506	5	corona	1	200	0	200	2026-04-12 22:49:51.072692+00	\N	\N
566	507	47	Doble reserva pq	1	750	0	750	2026-04-12 22:57:58.841328+00	\N	\N
567	507	14	jugo motts	1	300	0	300	2026-04-12 22:57:58.841328+00	\N	\N
568	507	56	Clorets	1	15	0	15	2026-04-12 22:57:58.841328+00	\N	\N
569	507	51	Agua maria	3	50	0	150	2026-04-12 22:57:58.841328+00	\N	\N
570	508	2	presi normal gr	2	200	0	400	2026-04-12 22:59:16.812322+00	\N	\N
571	508	1	presi light gr 	1	200	0	200	2026-04-12 22:59:16.812322+00	\N	\N
572	509	1	presi light gr 	1	200	0	200	2026-04-12 23:16:15.476826+00	\N	\N
573	510	1	presi light gr 	1	200	0	200	2026-04-12 23:16:16.620647+00	\N	\N
574	511	2	presi normal gr	1	200	0	200	2026-04-12 23:26:14.331104+00	\N	\N
575	512	2	presi normal gr	1	200	0	200	2026-04-12 23:29:14.058014+00	\N	\N
576	513	2	presi normal gr	1	200	0	200	2026-04-12 23:33:07.336041+00	\N	\N
577	514	1	presi light gr 	1	200	0	200	2026-04-12 23:33:51.468585+00	\N	\N
578	515	1	presi light gr 	1	200	0	200	2026-04-12 23:42:09.504202+00	\N	\N
579	516	1	presi light gr 	1	200	0	200	2026-04-12 23:42:50.503174+00	\N	\N
580	517	2	presi normal gr	1	200	0	200	2026-04-12 23:44:48.91389+00	\N	\N
581	517	1	presi light gr 	1	200	0	200	2026-04-12 23:44:48.91389+00	\N	\N
582	518	13	911	1	100	0	100	2026-04-12 23:46:48.576599+00	\N	\N
583	519	5	corona	1	200	0	200	2026-04-12 23:48:41.08607+00	\N	\N
584	519	2	presi normal gr	1	200	0	200	2026-04-12 23:48:41.08607+00	\N	\N
585	520	1	presi light gr 	1	200	0	200	2026-04-13 00:14:54.687111+00	\N	\N
586	521	1	presi light gr 	1	200	0	200	2026-04-13 00:28:07.893346+00	\N	\N
587	522	1	presi light gr 	1	200	0	200	2026-04-13 00:33:27.39789+00	\N	\N
588	523	1	presi light gr 	1	200	0	200	2026-04-13 00:36:21.171183+00	\N	\N
589	524	4	presi light peq	1	150	0	150	2026-04-13 00:39:51.493119+00	\N	\N
590	525	6	one peq	2	150	0	300	2026-04-13 00:42:31.442286+00	\N	\N
591	525	2	presi normal gr	2	200	0	400	2026-04-13 00:42:31.442286+00	\N	\N
592	526	1	presi light gr 	1	200	0	200	2026-04-13 00:43:23.444672+00	\N	\N
593	527	1	presi light gr 	1	200	0	200	2026-04-13 00:47:51.220523+00	\N	\N
594	528	1	presi light gr 	1	200	0	200	2026-04-13 00:49:08.168517+00	\N	\N
595	529	1	presi light gr 	1	200	0	200	2026-04-13 00:54:41.305722+00	\N	\N
596	530	2	presi normal gr	1	200	0	200	2026-04-13 00:58:17.296985+00	\N	\N
597	531	1	presi light gr 	1	200	0	200	2026-04-13 01:00:27.579038+00	\N	\N
598	532	1	presi light gr 	1	200	0	200	2026-04-13 01:02:28.278777+00	\N	\N
599	532	13	911	1	100	0	100	2026-04-13 01:02:28.278777+00	\N	\N
600	533	1	presi light gr 	1	200	0	200	2026-04-13 01:02:30.282543+00	\N	\N
601	533	13	911	1	100	0	100	2026-04-13 01:02:30.282543+00	\N	\N
602	534	1	presi light gr 	1	200	0	200	2026-04-13 01:04:12.608483+00	\N	\N
603	535	1	presi light gr 	1	200	0	200	2026-04-13 01:04:13.813047+00	\N	\N
604	536	4	presi light peq	1	150	0	150	2026-04-13 01:05:42.297495+00	\N	\N
605	537	56	Clorets	4	15	0	60	2026-04-13 01:10:45.283907+00	\N	\N
606	538	1	presi light gr 	1	200	0	200	2026-04-13 01:23:31.462903+00	\N	\N
607	539	1	presi light gr 	1	200	0	200	2026-04-13 01:23:32.597215+00	\N	\N
608	540	3	presi normal peq	1	150	0	150	2026-04-13 01:29:26.725039+00	\N	\N
609	542	2	presi normal gr	1	200	0	200	2026-04-13 01:37:15.762942+00	\N	\N
610	543	1	presi light gr 	1	200	0	200	2026-04-13 01:42:38.169643+00	\N	\N
611	544	1	presi light gr 	1	200	0	200	2026-04-13 01:42:38.695732+00	\N	\N
612	545	1	presi light gr 	1	200	0	200	2026-04-13 01:43:58.973381+00	\N	\N
613	546	3	presi normal peq	2	150	0	300	2026-04-13 01:45:01.268149+00	\N	\N
614	546	2	presi normal gr	1	200	0	200	2026-04-13 01:45:01.268149+00	\N	\N
615	547	3	presi normal peq	1	150	0	150	2026-04-13 01:51:51.52504+00	\N	\N
616	548	1	presi light gr 	4	200	0	800	2026-04-13 01:57:09.414355+00	\N	\N
617	548	2	presi normal gr	2	200	0	400	2026-04-13 01:57:09.414355+00	\N	\N
618	549	2	presi normal gr	6	200	0	1200	2026-04-13 01:58:09.314248+00	\N	\N
619	550	56	Clorets	2	15	0	30	2026-04-13 02:08:56.970292+00	\N	\N
620	551	2	presi normal gr	1	200	0	200	2026-04-13 02:21:24.790107+00	\N	\N
621	551	9	one gra	1	200	0	200	2026-04-13 02:21:24.790107+00	\N	\N
622	552	4	presi light peq	2	150	0	300	2026-04-13 02:23:01.285373+00	\N	\N
623	553	56	Clorets	2	15	0	30	2026-04-13 02:23:33.203171+00	\N	\N
624	554	6	one peq	1	150	0	150	2026-04-13 02:52:02.103644+00	\N	\N
625	554	2	presi normal gr	1	200	0	200	2026-04-13 02:52:02.103644+00	\N	\N
626	555	8	modelo peq	1	200	0	200	2026-04-13 02:56:59.025326+00	\N	\N
627	556	2	presi normal gr	2	200	0	400	2026-04-13 03:11:26.025725+00	\N	\N
628	557	2	presi normal gr	3	200	0	600	2026-04-13 03:20:14.308584+00	\N	\N
629	558	9	one gra	1	200	0	200	2026-04-13 03:21:06.737177+00	\N	\N
630	558	1	presi light gr 	1	200	0	200	2026-04-13 03:21:06.737177+00	\N	\N
631	559	2	presi normal gr	3	200	0	600	2026-04-13 03:29:28.694389+00	\N	\N
632	560	2	presi normal gr	1	200	0	200	2026-04-13 03:33:52.83182+00	\N	\N
633	560	4	presi light peq	2	150	0	300	2026-04-13 03:33:52.83182+00	\N	\N
634	561	2	presi normal gr	1	200	0	200	2026-04-13 21:50:34.52647+00	\N	\N
635	562	2	presi normal gr	2	200	0	400	2026-04-13 22:35:25.083443+00	\N	\N
636	563	2	presi normal gr	1	200	0	200	2026-04-14 00:16:02.500587+00	\N	\N
637	564	2	presi normal gr	1	200	0	200	2026-04-14 01:11:23.366568+00	\N	\N
638	565	1	presi light gr 	3	200	0	600	2026-04-14 01:13:51.148738+00	\N	\N
639	566	2	presi normal gr	1	200	0	200	2026-04-14 23:20:16.378217+00	\N	\N
640	567	9	one gra	1	200	0	200	2026-04-15 00:26:03.556503+00	\N	\N
641	567	12	seven up	1	50	0	50	2026-04-15 00:26:03.556503+00	\N	\N
642	568	2	presi normal gr	1	200	0	200	2026-04-15 01:43:08.037324+00	\N	\N
643	569	2	presi normal gr	1	200	0	200	2026-04-15 03:12:03.831842+00	\N	\N
644	569	1	presi light gr 	1	200	0	200	2026-04-15 03:12:03.831842+00	\N	\N
645	570	31	Extraviejo peq	1	600	0	600	2026-04-15 03:38:01.934383+00	\N	\N
646	570	14	jugo motts	1	300	0	300	2026-04-15 03:38:01.934383+00	\N	\N
647	570	1	presi light gr 	1	200	0	200	2026-04-15 03:38:01.934383+00	\N	\N
648	571	12	seven up	1	50	0	50	2026-04-15 03:38:39.572358+00	\N	\N
649	571	30	kings pride	1	200	0	200	2026-04-15 03:38:39.572358+00	\N	\N
650	571	31	Extraviejo peq	1	600	0	600	2026-04-15 03:38:39.572358+00	\N	\N
651	572	2	presi normal gr	6	200	0	1200	2026-04-15 03:40:52.873618+00	\N	\N
652	573	2	presi normal gr	1	200	0	200	2026-04-15 03:41:09.292628+00	\N	\N
653	574	2	presi normal gr	4	200	0	800	2026-04-15 22:38:08.996129+00	\N	\N
654	575	2	presi normal gr	3	200	0	600	2026-04-16 03:16:34.423798+00	\N	\N
655	576	1	presi light gr 	4	200	0	800	2026-04-16 03:21:59.848988+00	\N	\N
656	577	1	presi light gr 	1	200	0	200	2026-04-16 03:26:21.471416+00	\N	\N
657	578	9	one gra	1	200	0	200	2026-04-16 22:32:59.335474+00	\N	\N
658	579	4	presi light peq	1	150	0	150	2026-04-16 22:51:17.833405+00	\N	\N
659	580	9	one gra	1	200	0	200	2026-04-16 23:00:47.634666+00	\N	\N
660	581	6	one peq	3	150	0	450	2026-04-16 23:36:54.85897+00	\N	\N
661	581	9	one gra	2	200	0	400	2026-04-16 23:36:54.85897+00	\N	\N
662	582	6	one peq	2	150	0	300	2026-04-16 23:39:28.398396+00	\N	\N
663	583	2	presi normal gr	3	200	0	600	2026-04-17 01:41:47.794901+00	\N	\N
664	584	6	one peq	2	150	0	300	2026-04-17 02:22:34.108363+00	\N	\N
665	585	2	presi normal gr	1	200	0	200	2026-04-17 21:50:46.189261+00	\N	\N
666	586	9	one gra	2	200	0	400	2026-04-17 22:38:02.223567+00	\N	\N
667	587	1	presi light gr 	1	200	0	200	2026-04-17 22:43:26.77385+00	\N	\N
668	588	9	one gra	1	200	0	200	2026-04-17 22:46:08.782055+00	\N	\N
669	589	1	presi light gr 	1	200	0	200	2026-04-17 22:55:53.310798+00	\N	\N
670	589	2	presi normal gr	2	200	0	400	2026-04-17 22:55:53.310798+00	\N	\N
671	590	1	presi light gr 	1	200	0	200	2026-04-17 23:04:03.590129+00	\N	\N
672	591	9	one gra	1	200	0	200	2026-04-17 23:08:11.702229+00	\N	\N
673	592	1	presi light gr 	1	200	0	200	2026-04-17 23:20:34.568539+00	\N	\N
674	593	1	presi light gr 	1	200	0	200	2026-04-17 23:37:37.837838+00	\N	\N
675	594	1	presi light gr 	1	200	0	200	2026-04-17 23:49:25.178156+00	\N	\N
676	595	53	Smirnoff	1	225	0	225	2026-04-17 23:54:20.522895+00	\N	\N
677	596	51	Agua maria	1	50	0	50	2026-04-18 00:02:21.471735+00	\N	\N
678	597	1	presi light gr 	3	200	0	600	2026-04-18 00:11:44.208018+00	\N	\N
679	598	1	presi light gr 	1	200	0	200	2026-04-18 00:16:07.205373+00	\N	\N
680	599	9	one gra	2	200	0	400	2026-04-18 00:27:13.54756+00	\N	\N
681	600	1	presi light gr 	4	200	0	800	2026-04-18 03:38:51.486736+00	\N	\N
682	601	12	seven up	2	50	0	100	2026-04-18 03:40:38.970378+00	\N	\N
683	602	9	one gra	1	200	0	200	2026-04-18 21:02:37.94423+00	\N	\N
684	603	9	one gra	1	200	0	200	2026-04-18 21:11:56.035822+00	\N	\N
685	604	1	presi light gr 	1	200	0	200	2026-04-18 21:59:11.677185+00	\N	\N
686	605	1	presi light gr 	1	200	0	200	2026-04-18 22:29:01.671132+00	\N	\N
687	606	1	presi light gr 	4	200	0	800	2026-04-18 23:20:31.511177+00	\N	\N
688	607	1	presi light gr 	1	200	0	200	2026-04-18 23:56:26.43373+00	\N	\N
689	608	9	one gra	2	200	0	400	2026-04-19 01:33:48.422392+00	\N	\N
690	609	9	one gra	2	200	0	400	2026-04-19 01:33:49.936129+00	\N	\N
691	610	9	one gra	1	200	0	200	2026-04-19 02:03:33.989413+00	\N	\N
692	611	9	one gra	3	200	0	600	2026-04-19 02:19:20.929975+00	\N	\N
693	612	9	one gra	1	200	0	200	2026-04-19 02:41:53.679002+00	\N	\N
694	613	3	presi normal peq	1	150	0	150	2026-04-19 02:54:16.853501+00	\N	\N
695	614	9	one gra	1	200	0	200	2026-04-19 02:55:39.326671+00	\N	\N
696	615	9	one gra	1	200	0	200	2026-04-19 03:30:27.638966+00	\N	\N
697	616	1	presi light gr 	2	200	0	400	2026-04-19 21:17:48.780585+00	\N	\N
698	617	1	presi light gr 	2	200	0	400	2026-04-19 21:17:50.488778+00	\N	\N
699	618	2	presi normal gr	1	200	0	200	2026-04-19 22:01:49.240814+00	\N	\N
700	619	1	presi light gr 	1	200	0	200	2026-04-19 22:17:51.68697+00	\N	\N
701	620	30	kings pride	1	200	0	200	2026-04-19 23:00:28.884322+00	\N	\N
702	621	2	presi normal gr	1	200	0	200	2026-04-19 23:07:43.515205+00	\N	\N
703	622	1	presi light gr 	1	200	0	200	2026-04-19 23:29:08.408361+00	\N	\N
704	623	2	presi normal gr	1	200	0	200	2026-04-20 01:03:02.377162+00	\N	\N
705	624	51	Agua maria	1	50	0	50	2026-04-20 02:12:17.763025+00	\N	\N
706	624	2	presi normal gr	3	200	0	600	2026-04-20 02:12:17.763025+00	\N	\N
707	625	2	presi normal gr	1	200	0	200	2026-04-20 23:26:30.535259+00	\N	\N
708	626	2	presi normal gr	1	200	0	200	2026-04-20 23:36:43.668725+00	\N	\N
709	627	57	Gatarade	1	100	0	100	2026-04-20 23:57:47.817974+00	\N	\N
710	627	2	presi normal gr	1	200	0	200	2026-04-20 23:57:47.817974+00	\N	\N
711	628	2	presi normal gr	1	200	0	200	2026-04-21 00:34:45.122107+00	\N	\N
712	629	2	presi normal gr	1	200	0	200	2026-04-21 00:34:46.444644+00	\N	\N
713	630	2	presi normal gr	1	200	0	200	2026-04-21 01:56:02.042333+00	\N	\N
714	631	2	presi normal gr	1	200	0	200	2026-04-21 03:18:45.306916+00	\N	\N
715	632	9	one gra	4	200	0	800	2026-04-21 22:07:34.33514+00	\N	\N
716	633	9	one gra	3	200	0	600	2026-04-21 22:29:51.77718+00	\N	\N
717	634	6	one peq	1	150	0	150	2026-04-22 00:34:37.723585+00	\N	\N
718	634	2	presi normal gr	1	200	0	200	2026-04-22 00:34:37.723585+00	\N	\N
719	635	2	presi normal gr	1	200	0	200	2026-04-22 01:14:21.239534+00	\N	\N
720	636	4	presi light peq	2	150	0	300	2026-04-22 01:31:53.546486+00	\N	\N
721	637	4	presi light peq	2	150	0	300	2026-04-22 01:31:55.058772+00	\N	\N
722	638	2	presi normal gr	2	200	0	400	2026-04-22 01:43:55.765282+00	\N	\N
723	639	4	presi light peq	2	150	0	300	2026-04-22 01:51:19.680669+00	\N	\N
724	640	3	presi normal peq	1	150	0	150	2026-04-22 03:14:29.1604+00	\N	\N
725	640	12	seven up	1	50	0	50	2026-04-22 03:14:29.1604+00	\N	\N
726	640	31	Extraviejo peq	1	600	0	600	2026-04-22 03:14:29.1604+00	\N	\N
727	641	3	presi normal peq	1	150	0	150	2026-04-22 03:14:30.151302+00	\N	\N
728	641	12	seven up	1	50	0	50	2026-04-22 03:14:30.151302+00	\N	\N
729	641	31	Extraviejo peq	1	600	0	600	2026-04-22 03:14:30.151302+00	\N	\N
730	642	1	presi light gr 	3	200	0	600	2026-04-22 03:40:37.453829+00	\N	\N
731	642	57	Gatarade	1	100	0	100	2026-04-22 03:40:37.453829+00	\N	\N
732	643	1	presi light gr 	3	200	0	600	2026-04-22 03:40:38.960087+00	\N	\N
733	643	57	Gatarade	1	100	0	100	2026-04-22 03:40:38.960087+00	\N	\N
734	644	1	presi light gr 	1	200	0	200	2026-04-22 03:44:19.762961+00	\N	\N
736	649	56	Clorets	1	15	0	15	2026-04-23 03:22:03.744412+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
737	650	56	Clorets	1	15	0	15	2026-04-23 03:26:34.395583+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
738	651	56	Clorets	1	15	0	15	2026-04-23 03:34:04.913522+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
739	652	1	presi light gr 	3	200	0	600	2026-04-23 19:30:07.001546+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
740	652	31	Extraviejo peq	1	600	0	600	2026-04-23 19:30:07.001546+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
741	653	1	presi light gr 	2	200	0	400	2026-04-23 22:55:54.120878+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
742	654	1	presi light gr 	1	200	0	200	2026-04-23 23:14:40.001026+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
743	655	1	presi light gr 	1	200	0	200	2026-04-23 23:29:08.69604+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
744	656	1	presi light gr 	1	200	0	200	2026-04-23 23:39:38.831127+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
745	657	1	presi light gr 	1	200	0	200	2026-04-23 23:48:51.232939+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
746	658	1	presi light gr 	1	200	0	200	2026-04-24 00:25:37.08854+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
747	659	1	presi light gr 	1	200	0	200	2026-04-24 00:26:59.401666+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
748	660	1	presi light gr 	1	200	0	200	2026-04-24 00:44:03.523147+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
749	661	56	Clorets	1	15	0	15	2026-04-24 16:45:50.597829+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
750	662	56	Clorets	1	15	0	15	2026-04-24 16:45:51.450422+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
751	663	56	Clorets	2	15	0	30	2026-04-24 20:45:55.560386+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
752	664	56	Clorets	2	15	0	30	2026-04-24 20:45:57.269129+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
753	665	6	one peq	1	150	0	150	2026-04-24 21:29:30.645938+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
754	666	1	presi light gr 	1	200	0	200	2026-04-25 01:43:51.394539+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
755	667	3	presi normal peq	1	150	0	150	2026-04-25 01:45:19.555547+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
756	668	3	presi normal peq	1	150	0	150	2026-04-25 02:08:49.002707+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
757	669	1	presi light gr 	1	200	0	200	2026-04-25 02:29:54.087552+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
758	669	2	presi normal gr	1	200	0	200	2026-04-25 02:29:54.087552+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
759	670	3	presi normal peq	1	150	0	150	2026-04-25 02:38:07.40808+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
760	671	4	presi light peq	2	150	0	300	2026-04-25 02:41:49.770262+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
761	671	38	Leyenda azul	1	1800	0	1800	2026-04-25 02:41:49.770262+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
762	672	3	presi normal peq	1	150	0	150	2026-04-25 03:14:52.90957+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
763	673	5	corona	2	200	0	400	2026-04-25 03:17:44.767386+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
764	673	9	one gra	1	200	0	200	2026-04-25 03:17:44.767386+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
765	674	1	presi light gr 	1	200	0	200	2026-04-25 04:12:58.753723+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
766	675	30	kings pride	2	200	0	400	2026-04-25 04:27:11.172949+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
767	675	2	presi normal gr	7	200	0	1400	2026-04-25 04:27:11.172949+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
768	675	1	presi light gr 	5	200	0	1000	2026-04-25 04:27:11.172949+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
769	675	10	rell bull	2	200	0	400	2026-04-25 04:27:11.172949+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
770	676	1	presi light gr 	1	200	0	200	2026-04-25 20:41:44.044505+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
771	677	9	one gra	1	200	0	200	2026-04-25 21:06:43.573601+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
772	678	2	presi normal gr	2	200	0	400	2026-04-25 21:34:36.164821+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
773	679	9	one gra	1	200	0	200	2026-04-25 21:51:04.031709+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
774	680	9	one gra	1	200	0	200	2026-04-25 21:51:04.031709+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
775	681	56	Clorets	1	15	0	15	2026-04-25 23:30:27.168178+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
776	681	1	presi light gr 	6	200	0	1200	2026-04-25 23:30:27.168178+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
777	682	13	911	2	100	0	200	2026-04-26 01:58:58.1863+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
778	683	35	Doble reserva	1	1500	0	1500	2026-04-26 02:00:36.125885+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
779	683	14	jugo motts	1	300	0	300	2026-04-26 02:00:36.125885+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
780	683	1	presi light gr 	1	200	0	200	2026-04-26 02:00:36.125885+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
781	683	51	Agua maria	2	50	0	100	2026-04-26 02:00:36.125885+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
782	684	3	presi normal peq	1	150	0	150	2026-04-26 02:17:53.56411+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
783	684	4	presi light peq	1	150	0	150	2026-04-26 02:17:53.56411+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
784	685	3	presi normal peq	1	150	0	150	2026-04-26 02:18:33.922134+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
785	686	12	seven up	1	50	0	50	2026-04-26 02:42:33.062431+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
786	686	11	enriquillo sosa 	1	75	0	75	2026-04-26 02:42:33.062431+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
787	686	35	Doble reserva	1	1500	0	1500	2026-04-26 02:42:33.062431+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
788	687	3	presi normal peq	1	150	0	150	2026-04-26 02:50:31.778402+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
789	688	2	presi normal gr	3	200	0	600	2026-04-26 03:32:44.720436+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
790	689	57	Gatarade	1	100	0	100	2026-04-26 03:33:30.893098+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
791	689	2	presi normal gr	1	200	0	200	2026-04-26 03:33:30.893098+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
792	690	1	presi light gr 	2	200	0	400	2026-04-26 03:35:50.931216+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
793	690	11	enriquillo sosa 	1	75	0	75	2026-04-26 03:35:50.931216+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
794	690	57	Gatarade	1	100	0	100	2026-04-26 03:35:50.931216+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
795	691	1	presi light gr 	1	200	0	200	2026-04-26 21:39:56.347183+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
796	692	9	one gra	4	200	0	800	2026-04-26 22:53:06.684424+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
797	692	13	911	1	100	0	100	2026-04-26 22:53:06.684424+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
798	693	1	presi light gr 	1	200	0	200	2026-04-26 22:54:16.109589+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
799	694	9	one gra	1	200	0	200	2026-04-26 23:48:22.547601+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
800	695	3	presi normal peq	1	150	0	150	2026-04-26 23:50:11.999317+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
801	696	1	presi light gr 	1	200	0	200	2026-04-26 23:50:56.36247+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
802	697	2	presi normal gr	5	200	0	1000	2026-04-27 22:39:21.561642+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
803	698	2	presi normal gr	1	200	0	200	2026-04-27 23:20:15.755349+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
804	699	2	presi normal gr	1	200	0	200	2026-04-28 00:10:43.550464+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
805	700	3	presi normal peq	3	150	0	450	2026-04-28 00:11:20.472409+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
806	701	56	Clorets	1	15	0	15	2026-04-28 01:36:59.36241+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
807	702	1	presi light gr 	6	200	0	1200	2026-04-29 00:08:21.537704+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
808	703	2	presi normal gr	5	200	0	1000	2026-04-29 03:09:53.551157+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
809	703	4	presi light peq	1	150	0	150	2026-04-29 03:09:53.551157+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
810	704	1	presi light gr 	4	200	0	800	2026-05-01 00:22:34.244087+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
811	705	1	presi light gr 	1	200	0	200	2026-05-01 00:31:28.441615+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
812	706	2	presi normal gr	4	200	0	800	2026-05-01 00:42:30.034704+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
813	707	3	presi normal peq	1	150	0	150	2026-05-01 01:46:55.254334+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
814	708	2	presi normal gr	4	200	0	800	2026-05-01 01:47:16.390038+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
815	709	2	presi normal gr	3	200	0	600	2026-05-01 01:49:37.183273+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
816	710	54	Shot Tequila	3	175	0	525	2026-05-01 20:42:55.36769+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
817	711	2	presi normal gr	2	200	0	400	2026-05-01 22:11:05.1614+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
818	712	3	presi normal peq	1	150	0	150	2026-05-01 23:17:37.534845+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
819	712	2	presi normal gr	4	200	0	800	2026-05-01 23:17:37.534845+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
820	713	1	presi light gr 	4	200	0	800	2026-05-02 00:51:10.316576+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
821	713	4	presi light peq	1	150	0	150	2026-05-02 00:51:10.316576+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
822	714	2	presi normal gr	2	200	0	400	2026-05-02 00:51:53.502813+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
823	715	2	presi normal gr	3	200	0	600	2026-05-02 02:15:26.046449+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
824	715	3	presi normal peq	2	150	0	300	2026-05-02 02:15:26.046449+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
825	716	2	presi normal gr	2	200	0	400	2026-05-02 02:32:43.371516+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
826	717	1	presi light gr 	1	200	0	200	2026-05-02 02:46:17.967159+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
827	717	2	presi normal gr	1	200	0	200	2026-05-02 02:46:17.967159+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
828	718	6	one peq	6	150	0	900	2026-05-02 02:47:11.629715+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
829	719	2	presi normal gr	3	200	0	600	2026-05-02 02:57:01.732603+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
830	720	2	presi normal gr	1	200	0	200	2026-05-02 02:57:56.840588+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
831	721	1	presi light gr 	3	200	0	600	2026-05-02 04:20:26.89718+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
832	722	1	presi light gr 	2	200	0	400	2026-05-02 23:34:24.990521+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
833	723	56	Clorets	2	15	0	30	2026-05-02 23:35:36.983126+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
834	724	2	presi normal gr	4	200	0	800	2026-05-03 01:25:32.085967+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
835	725	1	presi light gr 	1	200	0	200	2026-05-03 02:25:19.805731+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
836	726	1	presi light gr 	1	200	0	200	2026-05-03 02:26:57.888555+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
837	727	34	añejo peq	1	600	0	600	2026-05-03 02:37:21.852129+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
838	727	12	seven up	1	50	0	50	2026-05-03 02:37:21.852129+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
839	727	1	presi light gr 	3	200	0	600	2026-05-03 02:37:21.852129+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
840	728	3	presi normal peq	2	150	0	300	2026-05-03 03:24:48.593933+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
841	728	2	presi normal gr	1	200	0	200	2026-05-03 03:24:48.593933+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
842	729	9	one gra	3	200	0	600	2026-05-03 03:27:23.872305+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
843	730	1	presi light gr 	5	200	0	1000	2026-05-03 03:45:43.005334+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
844	731	12	seven up	1	50	0	50	2026-05-03 03:46:32.839119+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
845	732	54	Shot Tequila	1	175	0	175	2026-05-03 03:50:07.846414+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
846	732	6	one peq	2	150	0	300	2026-05-03 03:50:07.846414+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
847	733	6	one peq	1	150	0	150	2026-05-03 03:50:46.040903+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
848	734	1	presi light gr 	3	200	0	600	2026-05-03 03:54:15.706483+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
849	735	1	presi light gr 	4	200	0	800	2026-05-03 03:55:12.518358+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
850	736	1	presi light gr 	2	200	0	400	2026-05-03 03:57:25.238622+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
851	737	1	presi light gr 	1	200	0	200	2026-05-03 04:00:48.023811+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
852	738	1	presi light gr 	2	200	0	400	2026-05-03 21:56:23.14371+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
853	739	2	presi normal gr	2	200	0	400	2026-05-03 21:58:18.520589+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
854	739	51	Agua Dasani	1	75	0	75	2026-05-03 21:58:18.520589+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
855	740	2	presi normal gr	2	200	0	400	2026-05-03 21:58:19.871445+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
856	740	51	Agua Dasani	1	75	0	75	2026-05-03 21:58:19.871445+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
857	741	2	presi normal gr	2	200	0	400	2026-05-03 21:59:28.716945+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
858	741	57	Gatarade	1	100	0	100	2026-05-03 21:59:28.716945+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
859	742	30	kings pride	1	200	0	200	2026-05-03 22:30:12.909672+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
860	743	4	presi light peq	1	150	0	150	2026-05-04 00:47:04.807484+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
861	744	1	presi light gr 	3	200	0	600	2026-05-04 02:28:56.256162+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
862	745	2	presi normal gr	1	200	0	200	2026-05-05 01:09:14.386849+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
863	746	1	presi light gr 	1	200	0	200	2026-05-05 23:28:15.695602+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
864	747	2	presi normal gr	2	200	0	400	2026-05-05 23:28:52.430884+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
865	748	2	presi normal gr	2	200	0	400	2026-05-05 23:28:53.056794+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
866	749	2	presi normal gr	1	200	0	200	2026-05-05 23:45:05.615611+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
867	750	2	presi normal gr	1	200	0	200	2026-05-06 00:15:12.862109+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
868	751	2	presi normal gr	1	200	0	200	2026-05-06 00:15:13.52826+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
869	752	2	presi normal gr	3	200	0	600	2026-05-06 23:16:52.25071+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
870	753	2	presi normal gr	1	200	0	200	2026-05-06 23:17:38.895908+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
871	753	1	presi light gr 	1	200	0	200	2026-05-06 23:17:38.895908+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
872	754	2	presi normal gr	4	200	0	800	2026-05-07 02:34:56.264472+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
873	755	1	presi light gr 	1	200	0	200	2026-05-07 02:36:33.308003+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
874	755	2	presi normal gr	3	200	0	600	2026-05-07 02:36:33.308003+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
875	756	2	presi normal gr	2	200	0	400	2026-05-07 03:41:21.844592+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
876	757	2	presi normal gr	3	200	0	600	2026-05-09 03:29:15.894178+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
877	758	1	Presidents Gr Light	3	200	0	600	2026-05-11 03:48:23.696555+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
878	759	6	One Pequeña	2	150	0	300	2026-05-11 03:49:08.40005+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
879	759	13	911	1	100	0	100	2026-05-11 03:49:08.40005+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
880	759	51	Agua Dasani	1	50	0	50	2026-05-11 03:49:08.40005+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
881	760	9	One Grande	4	200	0	800	2026-05-11 03:49:38.121118+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
882	761	2	Presidents Gr Normal	3	200	0	600	2026-05-12 03:19:25.107806+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
883	762	2	Presidents Gr Normal	2	200	0	400	2026-05-12 03:20:08.247204+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
884	762	1	Presidents Gr Light	3	200	0	600	2026-05-12 03:20:08.247204+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
885	763	14	Jugo Motts	1	300	0	300	2026-05-13 01:05:23.232779+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
886	763	47	Doble reserva pq	1	750	0	750	2026-05-13 01:05:23.232779+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
887	764	2	Presidents Gr Normal	3	200	0	600	2026-05-13 01:08:09.01458+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
888	764	9	One Grande	1	200	0	200	2026-05-13 01:08:09.01458+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
889	764	3	Presidente Peq Normal	2	150	0	300	2026-05-13 01:08:09.01458+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
890	765	35	Doble reserva	1	1500	0	1500	2026-05-13 01:43:44.578773+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
891	765	13	911	1	100	0	100	2026-05-13 01:43:44.578773+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
892	765	4	Presidente Peq Light	2	150	0	300	2026-05-13 01:43:44.578773+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
893	766	2	Presidents Gr Normal	4	200	0	800	2026-05-13 03:46:48.405155+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
894	767	2	Presi Gr Normal	2	200	0	400	2026-05-14 01:49:28.776251+00	ee860ed4-5d7a-495d-a517-d4a887f9a3f3	\N
\.


--
-- Data for Name: messages_2026_05_11; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_05_11 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_05_12; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_05_12 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_05_13; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_05_13 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_05_14; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_05_14 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_05_15; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_05_15 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_05_16; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_05_16 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_05_17; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_05_17 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2026-02-24 15:34:07
20211116045059	2026-02-24 15:34:08
20211116050929	2026-02-24 15:34:08
20211116051442	2026-02-24 15:36:02
20211116212300	2026-02-24 15:36:03
20211116213355	2026-02-24 15:36:03
20211116213934	2026-02-24 15:36:03
20211116214523	2026-02-24 15:36:03
20211122062447	2026-02-24 15:36:03
20211124070109	2026-02-24 15:36:04
20211202204204	2026-02-24 15:36:04
20211202204605	2026-02-24 15:36:04
20211210212804	2026-02-24 15:36:05
20211228014915	2026-02-24 15:36:05
20220107221237	2026-02-24 15:36:05
20220228202821	2026-02-24 15:36:05
20220312004840	2026-02-24 15:36:05
20220603231003	2026-02-24 15:36:06
20220603232444	2026-02-24 15:36:06
20220615214548	2026-02-24 15:36:06
20220712093339	2026-02-24 15:36:06
20220908172859	2026-02-24 15:36:06
20220916233421	2026-02-24 15:36:07
20230119133233	2026-02-24 15:36:07
20230128025114	2026-02-24 15:36:07
20230128025212	2026-02-24 15:36:07
20230227211149	2026-02-24 15:36:07
20230228184745	2026-02-24 15:36:08
20230308225145	2026-02-24 15:36:08
20230328144023	2026-02-24 15:36:08
20231018144023	2026-02-24 15:36:08
20231204144023	2026-02-24 15:36:09
20231204144024	2026-02-24 15:36:09
20231204144025	2026-02-24 15:36:09
20240108234812	2026-02-24 15:36:09
20240109165339	2026-02-24 15:36:09
20240227174441	2026-02-24 15:36:10
20240311171622	2026-02-24 15:36:10
20240321100241	2026-02-24 15:36:10
20240401105812	2026-02-24 15:36:11
20240418121054	2026-02-24 15:36:11
20240523004032	2026-02-24 15:36:12
20240618124746	2026-02-24 15:36:12
20240801235015	2026-02-24 15:36:12
20240805133720	2026-02-24 15:36:12
20240827160934	2026-02-24 15:36:13
20240919163303	2026-02-24 15:36:13
20240919163305	2026-02-24 15:36:13
20241019105805	2026-02-24 15:36:13
20241030150047	2026-02-24 15:36:14
20241108114728	2026-02-24 15:36:14
20241121104152	2026-02-24 15:36:14
20241130184212	2026-02-24 15:36:15
20241220035512	2026-02-24 15:36:15
20241220123912	2026-02-24 15:36:15
20241224161212	2026-02-24 15:36:15
20250107150512	2026-02-24 15:36:15
20250110162412	2026-02-24 15:36:15
20250123174212	2026-02-24 15:36:16
20250128220012	2026-02-24 15:36:16
20250506224012	2026-02-24 15:36:16
20250523164012	2026-02-24 15:36:16
20250714121412	2026-02-24 15:36:16
20250905041441	2026-02-24 15:36:17
20251103001201	2026-02-24 15:36:17
20251120212548	2026-02-24 15:36:17
20251120215549	2026-02-24 15:36:17
20260218120000	2026-02-27 12:58:51
20260326120000	2026-04-10 02:46:03
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
productos-imagenes	productos-imagenes	\N	2026-02-25 20:24:23.844155+00	2026-02-25 20:24:23.844155+00	t	f	5242880	{image/jpeg,image/png,image/webp,image/gif}	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-02-24 15:34:40.675135
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-02-24 15:34:40.705297
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2026-02-24 15:34:40.710583
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-02-24 15:34:40.732473
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-02-24 15:34:40.74273
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-02-24 15:34:40.745563
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2026-02-24 15:34:40.750006
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-02-24 15:34:40.753115
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-02-24 15:34:40.756513
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2026-02-24 15:34:40.760644
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2026-02-24 15:34:40.764702
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-02-24 15:34:40.768103
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-02-24 15:34:40.771574
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-02-24 15:34:40.786366
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-02-24 15:34:40.79028
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-02-24 15:34:40.810577
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-02-24 15:34:40.813416
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-02-24 15:34:40.816781
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-02-24 15:34:40.819473
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-02-24 15:34:40.824338
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-02-24 15:34:40.827467
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-02-24 15:34:40.831127
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-02-24 15:34:40.841481
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-02-24 15:34:40.849407
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-02-24 15:34:40.852572
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-02-24 15:34:40.85532
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2026-02-24 15:34:40.858945
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2026-02-24 15:34:40.861412
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2026-02-24 15:34:40.864406
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2026-02-24 15:34:40.867232
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2026-02-24 15:34:40.870378
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2026-02-24 15:34:40.873768
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2026-02-24 15:34:40.876945
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2026-02-24 15:34:40.880474
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2026-02-24 15:34:40.88381
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2026-02-24 15:34:40.886984
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2026-02-24 15:34:40.890024
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-02-24 15:34:40.892351
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2026-02-24 15:34:40.895483
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2026-02-24 15:34:40.903985
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2026-02-24 15:34:40.906928
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2026-02-24 15:34:40.909763
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2026-02-24 15:34:40.912509
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2026-02-24 15:34:40.915203
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-02-24 15:34:40.917638
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-02-24 15:34:40.920742
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-02-24 15:34:40.929922
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-02-24 15:34:40.934259
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2026-02-24 15:34:40.937788
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-02-24 15:34:40.96109
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-02-24 15:34:40.965732
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-02-24 15:34:41.11204
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-02-24 15:34:41.125287
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-02-24 15:34:41.13343
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-02-24 15:34:41.13507
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-02-24 15:34:41.136053
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-04-06 20:56:33.983111
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-04-06 20:56:33.995195
56	fix-optimized-search-function	b823ed1e418101032fa01374edc9a436e54e3ed4	2026-02-24 15:34:41.139783
59	drop-unused-functions	38456f13e39691c2bbb4b5151d0d1cdbabd4a8c4	2026-05-05 22:02:08.629136
60	optimize-existing-functions-again	db35e1c91a9201e59f4fef8d972c2f277d68b157	2026-05-05 22:02:08.645647
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
93abc698-c8c4-441e-bfc2-28e1f13ef8d8	productos-imagenes	producto-1-1772052038564.webp	\N	2026-02-25 20:40:38.476966+00	2026-02-25 20:40:38.476966+00	2026-02-25 20:40:38.476966+00	{"eTag": "\\"9340df4d2bc505d8f805babd0fa6593f\\"", "size": 56318, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T20:40:39.000Z", "contentLength": 56318, "httpStatusCode": 200}	5dc0eaad-c9aa-4a6c-8c27-8429ca867534	\N	{}
1a34617f-9bfb-4140-a747-e26849d001dd	productos-imagenes	img_logo-negocio_1776827992576.png	\N	2026-04-22 03:19:54.983807+00	2026-04-22 03:19:54.983807+00	2026-04-22 03:19:54.983807+00	{"eTag": "\\"e9ba17ea3dc6a19a6eac1230230de9e1\\"", "size": 2138997, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T03:19:55.000Z", "contentLength": 2138997, "httpStatusCode": 200}	81eed19d-bb0a-4dd8-ad69-40c698774a57	\N	{}
f55ed50b-b496-4492-8648-b53277cebb27	productos-imagenes	producto-1-1772057363362.jfif	\N	2026-02-25 22:10:09.418935+00	2026-02-25 22:10:09.418935+00	2026-02-25 22:10:09.418935+00	{"eTag": "\\"888a65cb72d3a9b56bc42922ed4907c4\\"", "size": 41047, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T22:10:10.000Z", "contentLength": 41047, "httpStatusCode": 200}	d1b4e9f9-e5a5-41b6-85d3-6de6b562f9b3	\N	{}
4625440a-472b-4999-8be9-1029e832c242	productos-imagenes	producto-temp-1772058740207.jpg	\N	2026-02-25 22:33:05.688181+00	2026-02-25 22:33:05.688181+00	2026-02-25 22:33:05.688181+00	{"eTag": "\\"2ed3842f120840206612cc562d228e65\\"", "size": 12880, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T22:33:06.000Z", "contentLength": 12880, "httpStatusCode": 200}	ec71006e-f99a-4765-9acb-58b17d3e002c	\N	{}
2764bf7e-a45d-4a71-80b4-ba9c5ffd2499	productos-imagenes	img_logo-negocio_1776828063566.png	\N	2026-04-22 03:21:05.841134+00	2026-04-22 03:21:05.841134+00	2026-04-22 03:21:05.841134+00	{"eTag": "\\"e9ba17ea3dc6a19a6eac1230230de9e1\\"", "size": 2138997, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T03:21:06.000Z", "contentLength": 2138997, "httpStatusCode": 200}	6746a124-18ae-4ce7-804c-934f30924622	\N	{}
d560b04b-3a53-4365-bcde-527730dfdd8e	productos-imagenes	producto-2-1772059042232.webp	\N	2026-02-25 22:37:21.846272+00	2026-02-25 22:37:21.846272+00	2026-02-25 22:37:21.846272+00	{"eTag": "\\"9340df4d2bc505d8f805babd0fa6593f\\"", "size": 56318, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T22:37:22.000Z", "contentLength": 56318, "httpStatusCode": 200}	a8c31b1b-2b98-4323-9b2f-7962b001e851	\N	{}
f5cedf04-7132-41d2-b5e0-d640d771d33d	productos-imagenes	producto-3-1772059853010.webp	\N	2026-02-25 22:50:52.720343+00	2026-02-25 22:50:52.720343+00	2026-02-25 22:50:52.720343+00	{"eTag": "\\"c001f3f4ce555efa9e2c38df9e8b6176\\"", "size": 48024, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T22:50:53.000Z", "contentLength": 48024, "httpStatusCode": 200}	67482aa6-8913-4a8d-8816-fa38730d67f0	\N	{}
869c5eac-853f-47a0-bedc-99ab6ab7fb03	productos-imagenes	img_logo-negocio_1776867881299.png	\N	2026-04-22 14:24:48.456881+00	2026-04-22 14:24:48.456881+00	2026-04-22 14:24:48.456881+00	{"eTag": "\\"e9ba17ea3dc6a19a6eac1230230de9e1\\"", "size": 2138997, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T14:24:49.000Z", "contentLength": 2138997, "httpStatusCode": 200}	1c48d8e5-98fc-47eb-9fb8-99be75cd2dfd	\N	{}
8340c315-5a07-48d1-8d5a-3a49935c224c	productos-imagenes	producto-4-1772060031093.jpg	\N	2026-02-25 22:53:50.607941+00	2026-02-25 22:53:50.607941+00	2026-02-25 22:53:50.607941+00	{"eTag": "\\"a7e367e52304900c2070cf2b1b2ed4a9\\"", "size": 14327, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T22:53:51.000Z", "contentLength": 14327, "httpStatusCode": 200}	0081b90e-cdc8-4df4-95f6-6e7c0bdec4e8	\N	{}
dcb9b32c-9bba-400a-8166-4250dbb936b3	productos-imagenes	producto-temp-1772060282370.png	\N	2026-02-25 22:58:02.592382+00	2026-02-25 22:58:02.592382+00	2026-02-25 22:58:02.592382+00	{"eTag": "\\"90d9fed75163983e0ab6d04e22499d13\\"", "size": 268975, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T22:58:03.000Z", "contentLength": 268975, "httpStatusCode": 200}	f8834394-b2f9-4d85-bf9a-0e415b903914	\N	{}
728f4c07-3db1-49c7-a6cf-efec0d60ead2	productos-imagenes	producto-temp-1772060549582.webp	\N	2026-02-25 23:02:29.066119+00	2026-02-25 23:02:29.066119+00	2026-02-25 23:02:29.066119+00	{"eTag": "\\"bd577cca0ad585fe5ec76ffe021b5788\\"", "size": 17406, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:02:29.000Z", "contentLength": 17406, "httpStatusCode": 200}	9cac172f-79be-45bc-bbef-6f973aaa4bf2	\N	{}
4f8670a1-ff4d-44d6-ace1-4f1bc0a40fe1	productos-imagenes	producto-7-1772060793832.webp	\N	2026-02-25 23:06:33.322104+00	2026-02-25 23:06:33.322104+00	2026-02-25 23:06:33.322104+00	{"eTag": "\\"a0796e2168d6f04902960fb7dadea168\\"", "size": 8414, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:06:34.000Z", "contentLength": 8414, "httpStatusCode": 200}	875485ed-4e89-42a2-8d18-0c16fa0b9273	\N	{}
5dcbce30-a805-4101-95d9-fbfbfb3967f2	productos-imagenes	producto-temp-1772060927018.jpg	\N	2026-02-25 23:08:46.991009+00	2026-02-25 23:08:46.991009+00	2026-02-25 23:08:46.991009+00	{"eTag": "\\"ba8f3c941692648fcea0e1726853954a\\"", "size": 149262, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:08:47.000Z", "contentLength": 149262, "httpStatusCode": 200}	73cd1cb5-8a41-4964-942b-ab3ae2c2b44c	\N	{}
a41a0047-40c0-4bb6-a86b-6159b13542e3	productos-imagenes	producto-temp-1772061243908.jpg	\N	2026-02-25 23:14:03.717006+00	2026-02-25 23:14:03.717006+00	2026-02-25 23:14:03.717006+00	{"eTag": "\\"2eebe39cd2914237864e201a4909f792\\"", "size": 22425, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:14:04.000Z", "contentLength": 22425, "httpStatusCode": 200}	447f944b-e983-452f-b53c-9baad8ce2625	\N	{}
e37e6aa6-d41b-48c1-9ac7-fe4b1609d02b	productos-imagenes	producto-temp-1772061419640.webp	\N	2026-02-25 23:16:59.431415+00	2026-02-25 23:16:59.431415+00	2026-02-25 23:16:59.431415+00	{"eTag": "\\"7cc1ed236e86b778f6eb762d4b878549\\"", "size": 3322, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:17:00.000Z", "contentLength": 3322, "httpStatusCode": 200}	d896e4a9-b600-41a6-ae26-9c6aa79fcb91	\N	{}
171fb919-0721-4542-83bd-26209e89284d	productos-imagenes	producto-temp-1772061651847.png	\N	2026-02-25 23:20:51.905167+00	2026-02-25 23:20:51.905167+00	2026-02-25 23:20:51.905167+00	{"eTag": "\\"9ae1d84490c6e34ac770c9f3c7043e92\\"", "size": 278383, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:20:52.000Z", "contentLength": 278383, "httpStatusCode": 200}	ec8b6551-c378-4372-aedf-990f5c703ecc	\N	{}
9e013fc7-9bf7-435b-ad9a-af8f2c0815f9	productos-imagenes	img_logo-negocio_1776857464152.png	\N	2026-04-22 11:31:05.375066+00	2026-04-22 11:31:05.375066+00	2026-04-22 11:31:05.375066+00	{"eTag": "\\"39284a011a0620018e56cfc10273411b\\"", "size": 19592, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T11:31:06.000Z", "contentLength": 19592, "httpStatusCode": 200}	8e7ec678-7cf1-48f7-8756-061067da8744	\N	{}
d290ecc8-41ff-442d-be45-8c832354b3c3	productos-imagenes	producto-temp-1772061924017.webp	\N	2026-02-25 23:25:23.855305+00	2026-02-25 23:25:23.855305+00	2026-02-25 23:25:23.855305+00	{"eTag": "\\"2f36e13c234460db9463a704e846ab4e\\"", "size": 34028, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:25:24.000Z", "contentLength": 34028, "httpStatusCode": 200}	e89d2ee6-8329-4928-9564-24a1ccf50151	\N	{}
c267ad4d-7b1c-470c-a4ed-9dcc590e217c	productos-imagenes	producto-temp-1772062187585.jpg	\N	2026-02-25 23:29:48.163569+00	2026-02-25 23:29:48.163569+00	2026-02-25 23:29:48.163569+00	{"eTag": "\\"43b12efba8ad3a614e92545312ce4c5d\\"", "size": 445856, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:29:48.000Z", "contentLength": 445856, "httpStatusCode": 200}	0ef5cca3-7530-4d53-a36d-ee500101d760	\N	{}
8213bf29-0110-45d7-95e1-a5d84ff4a836	productos-imagenes	img_logo-negocio_1776872788763.jpeg	\N	2026-04-22 15:46:27.72061+00	2026-04-22 15:46:27.72061+00	2026-04-22 15:46:27.72061+00	{"eTag": "\\"a078267caedc1a365b8de3e488ec87c9\\"", "size": 170906, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T15:46:28.000Z", "contentLength": 170906, "httpStatusCode": 200}	7e49f685-1e26-473d-92fd-addb0360fc25	\N	{}
3a276f35-6ac2-4245-a1bc-59fb2f8fa3d3	productos-imagenes	producto-temp-1772062377456.webp	\N	2026-02-25 23:32:57.359575+00	2026-02-25 23:32:57.359575+00	2026-02-25 23:32:57.359575+00	{"eTag": "\\"ec2e87be0367cbb06fcc22ddd042212d\\"", "size": 117528, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:32:58.000Z", "contentLength": 117528, "httpStatusCode": 200}	857ae78e-51fe-41e1-9953-1a3d0af163e5	\N	{}
560a7899-d316-4a7b-a52c-85dcd39d74a5	productos-imagenes	producto-temp-1772062569076.webp	\N	2026-02-25 23:36:08.826981+00	2026-02-25 23:36:08.826981+00	2026-02-25 23:36:08.826981+00	{"eTag": "\\"ff8eb69bce23e69e0ce47a7a3c02e24f\\"", "size": 25376, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:36:09.000Z", "contentLength": 25376, "httpStatusCode": 200}	5082aa0a-24d3-4a62-a4d4-b8403ddb2da6	\N	{}
e2d01a79-55ab-4664-b1d8-454486571333	productos-imagenes	producto-51-1777497640588.jpg	\N	2026-04-29 21:21:10.457215+00	2026-04-29 21:21:10.457215+00	2026-04-29 21:21:10.457215+00	{"eTag": "\\"fef1421fe93a01fbd6ce261346ea5a58\\"", "size": 522939, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-29T21:21:11.000Z", "contentLength": 522939, "httpStatusCode": 200}	d5218275-5e74-4d9c-bd9e-a98271feee42	\N	{}
53ca036c-1202-4641-a494-05262858b6d6	productos-imagenes	producto-temp-1772062781212.webp	\N	2026-02-25 23:39:40.957567+00	2026-02-25 23:39:40.957567+00	2026-02-25 23:39:40.957567+00	{"eTag": "\\"ec34a20f95b686abb406eacc85ff15bd\\"", "size": 16586, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:39:41.000Z", "contentLength": 16586, "httpStatusCode": 200}	6e9a8a20-298c-44b2-b1cd-42b32d9ea269	\N	{}
056c4a65-2d9e-438e-b0fe-2be4585e3e92	productos-imagenes	producto-temp-1772062989122.webp	\N	2026-02-25 23:43:08.972539+00	2026-02-25 23:43:08.972539+00	2026-02-25 23:43:08.972539+00	{"eTag": "\\"48389439fca66d074ff949b797622e00\\"", "size": 22540, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:43:09.000Z", "contentLength": 22540, "httpStatusCode": 200}	c962a74c-fdd3-42c4-8789-8dd2eaf436d0	\N	{}
3ba33e04-fa7e-4c63-a398-15e40cd4140e	productos-imagenes	producto-temp-1772063133730.webp	\N	2026-02-25 23:45:33.374018+00	2026-02-25 23:45:33.374018+00	2026-02-25 23:45:33.374018+00	{"eTag": "\\"eb990c10e754fa47464cd92e3a0d664e\\"", "size": 1694, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:45:34.000Z", "contentLength": 1694, "httpStatusCode": 200}	07354420-3637-4ed9-a1d1-f98c58b3c439	\N	{}
528247f6-cf5b-4c55-b8d6-9552281e39f6	productos-imagenes	producto-temp-1772063250430.webp	\N	2026-02-25 23:47:29.904038+00	2026-02-25 23:47:29.904038+00	2026-02-25 23:47:29.904038+00	{"eTag": "\\"e7a22dfebcbcd096b270b844d7111de3\\"", "size": 1928, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:47:30.000Z", "contentLength": 1928, "httpStatusCode": 200}	5e7cbb0e-a44e-445b-b596-4ed234b52b98	\N	{}
07d64e4c-a341-4961-87bb-404e7d5be36a	productos-imagenes	producto-temp-1772063371297.webp	\N	2026-02-25 23:49:31.061083+00	2026-02-25 23:49:31.061083+00	2026-02-25 23:49:31.061083+00	{"eTag": "\\"7be5798b60144802f5f9aab5381953b9\\"", "size": 2936, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:49:32.000Z", "contentLength": 2936, "httpStatusCode": 200}	756b7f36-1064-4cae-b7de-c72fb548f87a	\N	{}
564c09e3-7014-413b-b26e-879b9fc61c53	productos-imagenes	producto-temp-1772063585274.webp	\N	2026-02-25 23:53:05.167993+00	2026-02-25 23:53:05.167993+00	2026-02-25 23:53:05.167993+00	{"eTag": "\\"ecedd825f040547b47df4e73550a2d63\\"", "size": 4918, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T23:53:06.000Z", "contentLength": 4918, "httpStatusCode": 200}	32a2ee79-1845-4023-90ba-7fe5d45953d2	\N	{}
8feb7685-a6e7-45c2-b9e3-22d121f2f4a8	productos-imagenes	producto-temp-1772064062154.webp	\N	2026-02-26 00:01:02.268349+00	2026-02-26 00:01:02.268349+00	2026-02-26 00:01:02.268349+00	{"eTag": "\\"6fa2f7e3a018885e0206d4125664bed6\\"", "size": 34690, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-26T00:01:03.000Z", "contentLength": 34690, "httpStatusCode": 200}	71afd62d-2e0a-4e31-bd63-3c175c4652e6	\N	{}
bc3a37d6-5a16-423f-a60c-d87d16042e06	productos-imagenes	producto-temp-1772064223851.jpg	\N	2026-02-26 00:03:43.729433+00	2026-02-26 00:03:43.729433+00	2026-02-26 00:03:43.729433+00	{"eTag": "\\"a85e9f00e2d66259cf87586beaf7ace5\\"", "size": 80770, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-26T00:03:44.000Z", "contentLength": 80770, "httpStatusCode": 200}	2b252ef8-eaef-4cca-a20a-a9fd56f03bec	\N	{}
a96ec282-1dff-4156-9dc1-fa02f975c434	productos-imagenes	img_logo-negocio_1776861486188.jpeg	\N	2026-04-22 12:38:05.033759+00	2026-04-22 12:38:05.033759+00	2026-04-22 12:38:05.033759+00	{"eTag": "\\"a078267caedc1a365b8de3e488ec87c9\\"", "size": 170906, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T12:38:05.000Z", "contentLength": 170906, "httpStatusCode": 200}	9aec5783-afa5-4c8b-984f-e577108c8a16	\N	{}
316c6c56-c591-4cbe-9386-b134c27b8d73	productos-imagenes	producto-temp-1772064322436.webp	\N	2026-02-26 00:05:21.961876+00	2026-02-26 00:05:21.961876+00	2026-02-26 00:05:21.961876+00	{"eTag": "\\"f237227fea8c0faa1a2f77b739690ce1\\"", "size": 3754, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-26T00:05:22.000Z", "contentLength": 3754, "httpStatusCode": 200}	65599489-1445-428d-b0fd-7791a2184741	\N	{}
d9b28412-4790-48ef-9b31-6cd48f8640e9	productos-imagenes	producto-temp-1772064479917.webp	\N	2026-02-26 00:07:59.612463+00	2026-02-26 00:07:59.612463+00	2026-02-26 00:07:59.612463+00	{"eTag": "\\"0792de0751dc5ace101325971597c4a7\\"", "size": 2090, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-26T00:08:00.000Z", "contentLength": 2090, "httpStatusCode": 200}	55144772-af2e-4ef7-8445-6d7fae015996	\N	{}
41bfebad-bb45-4f39-9f37-a206a35f2e86	productos-imagenes	img_ee860ed4-5d7a-495d-a517-d4a887f9a3f3_1776874922384.png	\N	2026-04-22 16:22:05.273741+00	2026-04-22 16:22:05.273741+00	2026-04-22 16:22:05.273741+00	{"eTag": "\\"e9ba17ea3dc6a19a6eac1230230de9e1\\"", "size": 2138997, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T16:22:06.000Z", "contentLength": 2138997, "httpStatusCode": 200}	f1e8ba9b-c27e-4e44-858c-b6209a15253d	\N	{}
d217fbd0-2ebe-4c3f-ad47-4cd8c9fba5f2	productos-imagenes	producto-temp-1772064701394.webp	\N	2026-02-26 00:11:41.046246+00	2026-02-26 00:11:41.046246+00	2026-02-26 00:11:41.046246+00	{"eTag": "\\"64c3029bdfe122306c343b7d196ab7dc\\"", "size": 2730, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-26T00:11:41.000Z", "contentLength": 2730, "httpStatusCode": 200}	cb70a97c-c203-4366-8bb5-06edca504dbe	\N	{}
ddd3787b-e839-459c-bbc0-2da78cbc137a	productos-imagenes	producto-temp-1772064871034.webp	\N	2026-02-26 00:14:30.271872+00	2026-02-26 00:14:30.271872+00	2026-02-26 00:14:30.271872+00	{"eTag": "\\"e96cb47edd3c7d281f5473bdb9558aed\\"", "size": 3160, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-26T00:14:31.000Z", "contentLength": 3160, "httpStatusCode": 200}	f162d11e-22f3-4167-aa09-36ac325bfbc2	\N	{}
9eeb37cd-6cbe-4693-8342-a4cbaf1249bd	productos-imagenes	producto-temp-1772064973595.webp	\N	2026-02-26 00:16:12.887352+00	2026-02-26 00:16:12.887352+00	2026-02-26 00:16:12.887352+00	{"eTag": "\\"521a60e3367570057f7e0429fb55f018\\"", "size": 2192, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-26T00:16:13.000Z", "contentLength": 2192, "httpStatusCode": 200}	3d9093fa-034f-46d8-b231-c531ff2f1fc4	\N	{}
1a97ab43-7ed0-4df2-9a49-474ff67d8aed	productos-imagenes	producto-temp-1772065102120.jpg	\N	2026-02-26 00:18:21.643497+00	2026-02-26 00:18:21.643497+00	2026-02-26 00:18:21.643497+00	{"eTag": "\\"6962196632bb82f25b4f69abec3a747e\\"", "size": 3509, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-26T00:18:22.000Z", "contentLength": 3509, "httpStatusCode": 200}	3419c177-fdc5-4bf8-b86b-496aed9a521d	\N	{}
1cc8d624-2fd8-4333-83ef-84fcec93c9f5	productos-imagenes	producto-temp-1772065440560.webp	\N	2026-02-26 00:24:00.286985+00	2026-02-26 00:24:00.286985+00	2026-02-26 00:24:00.286985+00	{"eTag": "\\"c60abffc5d6c124a4a922b39f9d77f01\\"", "size": 5408, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-26T00:24:01.000Z", "contentLength": 5408, "httpStatusCode": 200}	77d8ba77-352a-4b47-adf5-22e9fc2af762	\N	{}
40da9dc3-3125-4b99-a505-0a95c959b193	productos-imagenes	producto-31-1774555308292.webp	\N	2026-03-26 20:01:48.445476+00	2026-03-26 20:01:48.445476+00	2026-03-26 20:01:48.445476+00	{"eTag": "\\"7b2bacc2c1ec32038cf3abc5315d5ff4\\"", "size": 3358, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:01:49.000Z", "contentLength": 3358, "httpStatusCode": 200}	a4aa8cb5-f450-452d-b37d-20cf5e8d2564	\N	{}
8fc4312a-54b9-4d70-b590-f9fc7f3838e7	productos-imagenes	producto-32-1774555367897.jpg	\N	2026-03-26 20:02:47.847678+00	2026-03-26 20:02:47.847678+00	2026-03-26 20:02:47.847678+00	{"eTag": "\\"8a83025833ee27c236b714018d45f510\\"", "size": 89327, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:02:48.000Z", "contentLength": 89327, "httpStatusCode": 200}	bf34809f-7c0b-4e3b-a327-e62a491f2c40	\N	{}
76b6ed51-2414-433e-baca-a4bb43b1fa25	productos-imagenes	producto-33-1774555657566.jpg	\N	2026-03-26 20:07:37.86632+00	2026-03-26 20:07:37.86632+00	2026-03-26 20:07:37.86632+00	{"eTag": "\\"d845820cd77c016726eee2c03cf5d49a\\"", "size": 33947, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:07:38.000Z", "contentLength": 33947, "httpStatusCode": 200}	c355c650-812e-41d1-a256-2d43ffc6046e	\N	{}
dbd113ac-05e9-4e3a-8d4a-1ba84933820e	productos-imagenes	producto-34-1774555674594.png	\N	2026-03-26 20:07:54.96255+00	2026-03-26 20:07:54.96255+00	2026-03-26 20:07:54.96255+00	{"eTag": "\\"e2c8dee0f2e737fffe3383d7c85a668e\\"", "size": 121036, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:07:55.000Z", "contentLength": 121036, "httpStatusCode": 200}	a32b067d-699b-4745-84f1-1a43c17a57f7	\N	{}
314105e1-e288-4069-96ab-8177631e7019	productos-imagenes	producto-35-1774555732219.webp	\N	2026-03-26 20:08:52.357707+00	2026-03-26 20:08:52.357707+00	2026-03-26 20:08:52.357707+00	{"eTag": "\\"7cc3058b9ae1ce5c319bc8352d58978a\\"", "size": 2858, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:08:53.000Z", "contentLength": 2858, "httpStatusCode": 200}	257521c1-018d-4e5e-a532-c0f7d0eb1f45	\N	{}
37adb9af-10c4-4bf6-a535-371d14d84467	productos-imagenes	img_logo-negocio_1776862277825.jpeg	\N	2026-04-22 12:51:16.723508+00	2026-04-22 12:51:16.723508+00	2026-04-22 12:51:16.723508+00	{"eTag": "\\"a078267caedc1a365b8de3e488ec87c9\\"", "size": 170906, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T12:51:17.000Z", "contentLength": 170906, "httpStatusCode": 200}	fb2e5cbc-3c6e-4c53-8673-8572cc866efa	\N	{}
dd5f6b99-0181-4be7-ab9d-f8e57cafd3ba	productos-imagenes	producto-38-1774555862695.webp	\N	2026-03-26 20:11:02.899929+00	2026-03-26 20:11:02.899929+00	2026-03-26 20:11:02.899929+00	{"eTag": "\\"4a8e66c7b1e9f61047966bd7801a307c\\"", "size": 3144, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:11:03.000Z", "contentLength": 3144, "httpStatusCode": 200}	1650e8cc-2a16-4ad1-a042-c12ef1a5719e	\N	{}
a392cfd0-7c33-45fb-805e-1527483ea4bd	productos-imagenes	producto-39-1774556134079.webp	\N	2026-03-26 20:15:34.18103+00	2026-03-26 20:15:34.18103+00	2026-03-26 20:15:34.18103+00	{"eTag": "\\"5989276b4982d971971a58cde67abb15\\"", "size": 3232, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:15:35.000Z", "contentLength": 3232, "httpStatusCode": 200}	3849eb31-d9a4-4fe1-b165-b7d1190b9438	\N	{}
2826a7c0-1fe1-4e51-91f9-70ced742ec7c	productos-imagenes	img_logo-negocio_1776862768704.jpeg	\N	2026-04-22 12:59:27.374739+00	2026-04-22 12:59:27.374739+00	2026-04-22 12:59:27.374739+00	{"eTag": "\\"a078267caedc1a365b8de3e488ec87c9\\"", "size": 170906, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T12:59:28.000Z", "contentLength": 170906, "httpStatusCode": 200}	57bb794a-5012-494a-8ae3-75f2797c212f	\N	{}
6646fd65-37ff-49f4-b4f6-359cc7466cee	productos-imagenes	producto-57-1776947315637.webp	\N	2026-04-23 12:28:34.903392+00	2026-04-23 12:28:34.903392+00	2026-04-23 12:28:34.903392+00	{"eTag": "\\"657905e9245dcbbf038b1611b72ed2c9\\"", "size": 4708, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-04-23T12:28:35.000Z", "contentLength": 4708, "httpStatusCode": 200}	b42d9e6f-4895-4523-819f-6605ec680789	\N	{}
fd16f5ee-d8fb-48ed-8674-3cd94fd660b4	productos-imagenes	producto-56-1776947363791.webp	\N	2026-04-23 12:29:23.082296+00	2026-04-23 12:29:23.082296+00	2026-04-23 12:29:23.082296+00	{"eTag": "\\"ce1138d6b411559f4887b992fa7f8691\\"", "size": 3812, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-04-23T12:29:24.000Z", "contentLength": 3812, "httpStatusCode": 200}	3111264f-e01b-4266-8db5-f72fcffc0493	\N	{}
af310e15-3784-4cbe-85f3-0ad2fe1a4f78	productos-imagenes	producto-55-1776947453964.webp	\N	2026-04-23 12:30:53.432029+00	2026-04-23 12:30:53.432029+00	2026-04-23 12:30:53.432029+00	{"eTag": "\\"7a7e6b269f44e0d476c56f4c9c4e7a31\\"", "size": 3062, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-04-23T12:30:54.000Z", "contentLength": 3062, "httpStatusCode": 200}	b8247693-9ef4-435b-968b-557951525267	\N	{}
c86157f1-bee2-41cb-a2ac-d52f380a7c48	productos-imagenes	producto-51-1776947528338.webp	\N	2026-04-23 12:32:07.62282+00	2026-04-23 12:32:07.62282+00	2026-04-23 12:32:07.62282+00	{"eTag": "\\"1a12989f45ed22491004f3d0789b0263\\"", "size": 1780, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-04-23T12:32:08.000Z", "contentLength": 1780, "httpStatusCode": 200}	6b974f89-5e57-4e77-a2e8-343fcfbc44a9	\N	{}
b5008739-1f36-454d-a93f-0bef21179fac	productos-imagenes	producto-52-1776947569197.webp	\N	2026-04-23 12:32:48.45305+00	2026-04-23 12:32:48.45305+00	2026-04-23 12:32:48.45305+00	{"eTag": "\\"ec894dbdd2030d2c18b41c4e33e5c169\\"", "size": 3962, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-04-23T12:32:49.000Z", "contentLength": 3962, "httpStatusCode": 200}	2d5e8e25-e220-4ab1-a794-041508f335f0	\N	{}
5814f4e7-a8b0-47f0-b20c-73ab9040f25e	productos-imagenes	producto-53-1776947621913.webp	\N	2026-04-23 12:33:41.234678+00	2026-04-23 12:33:41.234678+00	2026-04-23 12:33:41.234678+00	{"eTag": "\\"3ae274854bb304e53d3dac0eaa47f2ce\\"", "size": 2666, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-04-23T12:33:42.000Z", "contentLength": 2666, "httpStatusCode": 200}	0e4a3e1b-bbf2-41b4-b47f-50420ab53ea1	\N	{}
ffc597f2-a510-4dfd-8537-6872b76fd1f5	productos-imagenes	producto-54-1776947705632.webp	\N	2026-04-23 12:35:04.88261+00	2026-04-23 12:35:04.88261+00	2026-04-23 12:35:04.88261+00	{"eTag": "\\"25a1c0d8c04fd2f484d562aacb32e756\\"", "size": 4306, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-04-23T12:35:05.000Z", "contentLength": 4306, "httpStatusCode": 200}	bef124e3-512f-4590-bd4c-b3f685a459c7	\N	{}
c80a6868-69a7-4310-849c-6af5cff0d0b9	productos-imagenes	producto-36-1774555747254.webp	\N	2026-03-26 20:09:07.112361+00	2026-03-26 20:09:07.112361+00	2026-03-26 20:09:07.112361+00	{"eTag": "\\"7238a55610e9775a9133c5222abb590f\\"", "size": 2468, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:09:08.000Z", "contentLength": 2468, "httpStatusCode": 200}	53c6fe40-6ac9-4cfe-9406-e98b0c44ab2e	\N	{}
b4c919b6-73c2-4743-bea5-642f2d3be003	productos-imagenes	img_00000000-0000-0000-0000-000000000000_1776865453067.png	\N	2026-04-22 13:44:13.48647+00	2026-04-22 13:44:13.48647+00	2026-04-22 13:44:13.48647+00	{"eTag": "\\"39284a011a0620018e56cfc10273411b\\"", "size": 19592, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T13:44:14.000Z", "contentLength": 19592, "httpStatusCode": 200}	b9be4ab7-8f8b-4073-a792-d0c11e4ccdfc	\N	{}
bef3beb4-c27a-4249-92b5-17c601092e33	productos-imagenes	producto-37-1774555850363.webp	\N	2026-03-26 20:10:50.508047+00	2026-03-26 20:10:50.508047+00	2026-03-26 20:10:50.508047+00	{"eTag": "\\"f5115ac678d8517f357a499eaeb2e190\\"", "size": 3854, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:10:51.000Z", "contentLength": 3854, "httpStatusCode": 200}	40ed6022-ffae-4369-ace6-556960ed2eb2	\N	{}
f1c68675-4781-49f7-909e-6ad724987366	productos-imagenes	producto-40-1774557209446.webp	\N	2026-03-26 20:33:29.748041+00	2026-03-26 20:33:29.748041+00	2026-03-26 20:33:29.748041+00	{"eTag": "\\"993082251ff5ed9df45149675a37dcbb\\"", "size": 3542, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:33:30.000Z", "contentLength": 3542, "httpStatusCode": 200}	ee1c41b2-62a7-4ced-8e43-842b31c07610	\N	{}
4642636b-945d-4942-9933-81f414d61d88	productos-imagenes	img_logo-negocio_1776865525886.png	\N	2026-04-22 13:45:27.967189+00	2026-04-22 13:45:27.967189+00	2026-04-22 13:45:27.967189+00	{"eTag": "\\"e9ba17ea3dc6a19a6eac1230230de9e1\\"", "size": 2138997, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-22T13:45:28.000Z", "contentLength": 2138997, "httpStatusCode": 200}	72312762-81fb-4ec8-88c7-568fd9d3732c	\N	{}
3d01524e-64c1-4df8-b950-4f3853153eda	productos-imagenes	producto-41-1774557337483.webp	\N	2026-03-26 20:35:37.643885+00	2026-03-26 20:35:37.643885+00	2026-03-26 20:35:37.643885+00	{"eTag": "\\"1252e0a91fe59c60ddac7a1a3786c6fd\\"", "size": 2306, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:35:38.000Z", "contentLength": 2306, "httpStatusCode": 200}	35e5a0ab-b994-40a3-926a-6190f88043d9	\N	{}
c43e413c-f4b8-4167-a03c-f9f242d59d84	productos-imagenes	producto-42-1774557356747.webp	\N	2026-03-26 20:35:56.609548+00	2026-03-26 20:35:56.609548+00	2026-03-26 20:35:56.609548+00	{"eTag": "\\"b6d08dfe0a794611f5ce30c349ba16f4\\"", "size": 8638, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:35:57.000Z", "contentLength": 8638, "httpStatusCode": 200}	42a8f1b8-5cf5-463c-94e0-8135b77ceabd	\N	{}
ac29c163-5a2b-42c9-b8c0-c0cb1bcac435	productos-imagenes	producto-58-1777137041305.png	\N	2026-04-25 17:11:06.965702+00	2026-04-25 17:11:06.965702+00	2026-04-25 17:11:06.965702+00	{"eTag": "\\"a7b561d88c225b6068a7fdc8e5df1eb5\\"", "size": 1181898, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-25T17:11:07.000Z", "contentLength": 1181898, "httpStatusCode": 200}	9c272e3a-24cf-4cfa-b13d-e590299b35f5	\N	{}
8db14f8c-7a42-4aa8-9293-7f898803bba9	productos-imagenes	producto-43-1774557457387.jpg	\N	2026-03-26 20:37:37.987973+00	2026-03-26 20:37:37.987973+00	2026-03-26 20:37:37.987973+00	{"eTag": "\\"e293359438cabcc80afb64fea5d7e93d\\"", "size": 107475, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:37:38.000Z", "contentLength": 107475, "httpStatusCode": 200}	beb35b02-2caf-46e5-83b7-fd0b3f86f0ab	\N	{}
8e57191b-ca89-4995-83af-d3975a698f0c	productos-imagenes	producto-44-1774557618397.webp	\N	2026-03-26 20:40:18.622139+00	2026-03-26 20:40:18.622139+00	2026-03-26 20:40:18.622139+00	{"eTag": "\\"ca390803e3068615161c970e172ce0e3\\"", "size": 2624, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:40:19.000Z", "contentLength": 2624, "httpStatusCode": 200}	bf6010fd-d84e-4c45-b948-9d74673384c0	\N	{}
c2770c91-eaaf-4167-adc2-cce54d729fa8	productos-imagenes	producto-45-1774557782535.webp	\N	2026-03-26 20:43:02.873791+00	2026-03-26 20:43:02.873791+00	2026-03-26 20:43:02.873791+00	{"eTag": "\\"c937bdf251d28ab8ef4f2cc09125f136\\"", "size": 2008, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:43:03.000Z", "contentLength": 2008, "httpStatusCode": 200}	98c83d75-d26c-4981-b87b-961f92165625	\N	{}
97a51c41-c6ae-4323-a589-76838cc01e76	productos-imagenes	producto-46-1774558431196.webp	\N	2026-03-26 20:53:51.307236+00	2026-03-26 20:53:51.307236+00	2026-03-26 20:53:51.307236+00	{"eTag": "\\"214133ef0901b34179e5e846660ce789\\"", "size": 1858, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:53:52.000Z", "contentLength": 1858, "httpStatusCode": 200}	450e84b2-8d51-4f97-a1ea-748fb6bba947	\N	{}
90708a36-9f90-4c12-863b-9fe36dccca36	productos-imagenes	producto-47-1774558509101.webp	\N	2026-03-26 20:55:09.304916+00	2026-03-26 20:55:09.304916+00	2026-03-26 20:55:09.304916+00	{"eTag": "\\"a85d9a43b8aa2c6842ae834305b86d2a\\"", "size": 4602, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:55:10.000Z", "contentLength": 4602, "httpStatusCode": 200}	1b53f735-82a8-48b5-abc7-cff57c6b04c4	\N	{}
8acdd326-3075-4a68-9bd5-40b0aa11cf7e	productos-imagenes	producto-48-1774558664861.webp	\N	2026-03-26 20:57:45.008991+00	2026-03-26 20:57:45.008991+00	2026-03-26 20:57:45.008991+00	{"eTag": "\\"421a5c344e479ac7dc22f0875dc35c65\\"", "size": 2866, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:57:45.000Z", "contentLength": 2866, "httpStatusCode": 200}	338a5e26-c305-4842-8bcb-e60f1be1981f	\N	{}
d2282ec9-0bb0-4a2e-9bd4-7758d562a6af	productos-imagenes	producto-49-1774558679288.webp	\N	2026-03-26 20:57:59.10653+00	2026-03-26 20:57:59.10653+00	2026-03-26 20:57:59.10653+00	{"eTag": "\\"f0d24c5ca486272377942d017617119b\\"", "size": 3130, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-03-26T20:58:00.000Z", "contentLength": 3130, "httpStatusCode": 200}	eae636ae-1f6a-422c-a0af-c0b7f4aba937	\N	{}
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata, metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: arqueos_caja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arqueos_caja_id_seq', 88, true);


--
-- Name: cajas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cajas_id_seq', 106, true);


--
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 8, true);


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 2, true);


--
-- Name: compras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compras_id_seq', 1, false);


--
-- Name: cuentas_pagar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuentas_pagar_id_seq', 1, false);


--
-- Name: cuentas_por_cobrar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuentas_por_cobrar_id_seq', 8, true);


--
-- Name: detalles_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalles_compra_id_seq', 1, false);


--
-- Name: mesas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mesas_id_seq', 13, true);


--
-- Name: movimientos_caja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimientos_caja_id_seq', 754, true);


--
-- Name: pagos_cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_cuentas_id_seq', 13, true);


--
-- Name: pagos_cuentas_pagar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_cuentas_pagar_id_seq', 1, false);


--
-- Name: pedidos_mesa_detalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_mesa_detalle_id_seq', 362, true);


--
-- Name: pedidos_mesa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_mesa_id_seq', 307, true);


--
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 59, true);


--
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 7, true);


--
-- Name: secuencias_ncf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.secuencias_ncf_id_seq', 1, false);


--
-- Name: sesiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sesiones_id_seq', 287, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 10, true);


--
-- Name: ventas_detalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_detalle_id_seq', 894, true);


--
-- Name: ventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_id_seq', 767, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webauthn_challenges webauthn_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- Name: arqueos_caja arqueos_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arqueos_caja
    ADD CONSTRAINT arqueos_caja_pkey PRIMARY KEY (id);


--
-- Name: cajas cajas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajas
    ADD CONSTRAINT cajas_pkey PRIMARY KEY (id);


--
-- Name: categorias categorias_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_nombre_key UNIQUE (nombre);


--
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: compras compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id);


--
-- Name: configuracion_fiscal configuracion_fiscal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_fiscal
    ADD CONSTRAINT configuracion_fiscal_pkey PRIMARY KEY (id);


--
-- Name: cuentas_pagar cuentas_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_pagar
    ADD CONSTRAINT cuentas_pagar_pkey PRIMARY KEY (id);


--
-- Name: cuentas_por_cobrar cuentas_por_cobrar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_cobrar
    ADD CONSTRAINT cuentas_por_cobrar_pkey PRIMARY KEY (id);


--
-- Name: detalles_compra detalles_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_compra
    ADD CONSTRAINT detalles_compra_pkey PRIMARY KEY (id);


--
-- Name: mesas mesas_numero_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesas
    ADD CONSTRAINT mesas_numero_key UNIQUE (numero);


--
-- Name: mesas mesas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesas
    ADD CONSTRAINT mesas_pkey PRIMARY KEY (id);


--
-- Name: movimientos_caja movimientos_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_caja
    ADD CONSTRAINT movimientos_caja_pkey PRIMARY KEY (id);


--
-- Name: negocios negocios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.negocios
    ADD CONSTRAINT negocios_pkey PRIMARY KEY (id);


--
-- Name: pagos_cuentas_pagar pagos_cuentas_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos_cuentas_pagar
    ADD CONSTRAINT pagos_cuentas_pagar_pkey PRIMARY KEY (id);


--
-- Name: pagos_cuentas pagos_cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos_cuentas
    ADD CONSTRAINT pagos_cuentas_pkey PRIMARY KEY (id);


--
-- Name: pedidos_mesa_detalle pedidos_mesa_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_mesa_detalle
    ADD CONSTRAINT pedidos_mesa_detalle_pkey PRIMARY KEY (id);


--
-- Name: pedidos_mesa pedidos_mesa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_mesa
    ADD CONSTRAINT pedidos_mesa_pkey PRIMARY KEY (id);


--
-- Name: productos productos_codigo_barras_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_codigo_barras_key UNIQUE (codigo_barras);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: productos productos_sku_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_sku_key UNIQUE (sku);


--
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: roles roles_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_nombre_key UNIQUE (nombre);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: secuencias_ncf secuencias_ncf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secuencias_ncf
    ADD CONSTRAINT secuencias_ncf_pkey PRIMARY KEY (id);


--
-- Name: sesiones sesiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesiones
    ADD CONSTRAINT sesiones_pkey PRIMARY KEY (id);


--
-- Name: sesiones sesiones_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesiones
    ADD CONSTRAINT sesiones_token_key UNIQUE (token);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_username_key UNIQUE (username);


--
-- Name: ventas_detalle ventas_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT ventas_detalle_pkey PRIMARY KEY (id);


--
-- Name: ventas ventas_numero_venta_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_numero_venta_key UNIQUE (numero_venta);


--
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_05_11 messages_2026_05_11_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_05_11
    ADD CONSTRAINT messages_2026_05_11_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_05_12 messages_2026_05_12_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_05_12
    ADD CONSTRAINT messages_2026_05_12_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_05_13 messages_2026_05_13_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_05_13
    ADD CONSTRAINT messages_2026_05_13_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_05_14 messages_2026_05_14_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_05_14
    ADD CONSTRAINT messages_2026_05_14_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_05_15 messages_2026_05_15_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_05_15
    ADD CONSTRAINT messages_2026_05_15_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_05_16 messages_2026_05_16_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_05_16
    ADD CONSTRAINT messages_2026_05_16_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_05_17 messages_2026_05_17_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_05_17
    ADD CONSTRAINT messages_2026_05_17_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: webauthn_challenges_expires_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_expires_at_idx ON auth.webauthn_challenges USING btree (expires_at);


--
-- Name: webauthn_challenges_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_user_id_idx ON auth.webauthn_challenges USING btree (user_id);


--
-- Name: webauthn_credentials_credential_id_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX webauthn_credentials_credential_id_key ON auth.webauthn_credentials USING btree (credential_id);


--
-- Name: webauthn_credentials_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_credentials_user_id_idx ON auth.webauthn_credentials USING btree (user_id);


--
-- Name: idx_arqueos_caja_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_arqueos_caja_negocio_id ON public.arqueos_caja USING btree (negocio_id);


--
-- Name: idx_cajas_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cajas_negocio_id ON public.cajas USING btree (negocio_id);


--
-- Name: idx_cajas_negocio_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cajas_negocio_uuid ON public.cajas USING btree (negocio_id);


--
-- Name: idx_clientes_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clientes_negocio_id ON public.clientes USING btree (negocio_id);


--
-- Name: idx_clientes_negocio_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clientes_negocio_uuid ON public.clientes USING btree (negocio_id);


--
-- Name: idx_compras_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compras_negocio_id ON public.compras USING btree (negocio_id);


--
-- Name: idx_cuentas_pagar_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cuentas_pagar_negocio_id ON public.cuentas_pagar USING btree (negocio_id);


--
-- Name: idx_cuentas_por_cobrar_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cuentas_por_cobrar_negocio_id ON public.cuentas_por_cobrar USING btree (negocio_id);


--
-- Name: idx_detalles_compra_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_detalles_compra_negocio_id ON public.detalles_compra USING btree (negocio_id);


--
-- Name: idx_movimientos_caja_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_movimientos_caja_negocio_id ON public.movimientos_caja USING btree (negocio_id);


--
-- Name: idx_pagos_cuentas_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pagos_cuentas_negocio_id ON public.pagos_cuentas USING btree (negocio_id);


--
-- Name: idx_pagos_cuentas_pagar_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pagos_cuentas_pagar_negocio_id ON public.pagos_cuentas_pagar USING btree (negocio_id);


--
-- Name: idx_productos_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_productos_negocio_id ON public.productos USING btree (negocio_id);


--
-- Name: idx_productos_negocio_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_productos_negocio_uuid ON public.productos USING btree (negocio_id);


--
-- Name: idx_usuarios_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usuarios_negocio_id ON public.usuarios USING btree (negocio_id);


--
-- Name: idx_usuarios_negocio_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usuarios_negocio_uuid ON public.usuarios USING btree (negocio_id);


--
-- Name: idx_ventas_negocio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ventas_negocio_id ON public.ventas USING btree (negocio_id);


--
-- Name: idx_ventas_negocio_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ventas_negocio_uuid ON public.ventas USING btree (negocio_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_05_11_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_05_11_inserted_at_topic_idx ON realtime.messages_2026_05_11 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_05_12_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_05_12_inserted_at_topic_idx ON realtime.messages_2026_05_12 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_05_13_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_05_13_inserted_at_topic_idx ON realtime.messages_2026_05_13 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_05_14_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_05_14_inserted_at_topic_idx ON realtime.messages_2026_05_14 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_05_15_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_05_15_inserted_at_topic_idx ON realtime.messages_2026_05_15 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_05_16_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_05_16_inserted_at_topic_idx ON realtime.messages_2026_05_16 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_05_17_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_05_17_inserted_at_topic_idx ON realtime.messages_2026_05_17 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_key ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: messages_2026_05_11_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_05_11_inserted_at_topic_idx;


--
-- Name: messages_2026_05_11_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_05_11_pkey;


--
-- Name: messages_2026_05_12_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_05_12_inserted_at_topic_idx;


--
-- Name: messages_2026_05_12_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_05_12_pkey;


--
-- Name: messages_2026_05_13_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_05_13_inserted_at_topic_idx;


--
-- Name: messages_2026_05_13_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_05_13_pkey;


--
-- Name: messages_2026_05_14_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_05_14_inserted_at_topic_idx;


--
-- Name: messages_2026_05_14_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_05_14_pkey;


--
-- Name: messages_2026_05_15_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_05_15_inserted_at_topic_idx;


--
-- Name: messages_2026_05_15_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_05_15_pkey;


--
-- Name: messages_2026_05_16_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_05_16_inserted_at_topic_idx;


--
-- Name: messages_2026_05_16_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_05_16_pkey;


--
-- Name: messages_2026_05_17_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_05_17_inserted_at_topic_idx;


--
-- Name: messages_2026_05_17_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_05_17_pkey;


--
-- Name: cajas tr_validar_limite_cajas; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tr_validar_limite_cajas BEFORE INSERT ON public.cajas FOR EACH ROW EXECUTE FUNCTION public.validar_limite_cajas_plan();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: webauthn_challenges webauthn_challenges_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: webauthn_credentials webauthn_credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: arqueos_caja arqueos_caja_caja_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arqueos_caja
    ADD CONSTRAINT arqueos_caja_caja_id_fkey FOREIGN KEY (caja_id) REFERENCES public.cajas(id);


--
-- Name: compras compras_negocio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_negocio_id_fkey FOREIGN KEY (negocio_id) REFERENCES public.negocios(id);


--
-- Name: compras compras_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id);


--
-- Name: compras compras_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: cuentas_pagar cuentas_pagar_negocio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_pagar
    ADD CONSTRAINT cuentas_pagar_negocio_id_fkey FOREIGN KEY (negocio_id) REFERENCES public.negocios(id);


--
-- Name: cuentas_pagar cuentas_pagar_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_pagar
    ADD CONSTRAINT cuentas_pagar_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id);


--
-- Name: cuentas_por_cobrar cuentas_por_cobrar_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_cobrar
    ADD CONSTRAINT cuentas_por_cobrar_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- Name: cuentas_por_cobrar cuentas_por_cobrar_negocio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_cobrar
    ADD CONSTRAINT cuentas_por_cobrar_negocio_id_fkey FOREIGN KEY (negocio_id) REFERENCES public.negocios(id);


--
-- Name: cuentas_por_cobrar cuentas_por_cobrar_venta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_cobrar
    ADD CONSTRAINT cuentas_por_cobrar_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES public.ventas(id);


--
-- Name: detalles_compra detalles_compra_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_compra
    ADD CONSTRAINT detalles_compra_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES public.compras(id);


--
-- Name: detalles_compra detalles_compra_negocio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_compra
    ADD CONSTRAINT detalles_compra_negocio_id_fkey FOREIGN KEY (negocio_id) REFERENCES public.negocios(id);


--
-- Name: detalles_compra detalles_compra_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_compra
    ADD CONSTRAINT detalles_compra_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- Name: movimientos_caja movimientos_caja_caja_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_caja
    ADD CONSTRAINT movimientos_caja_caja_id_fkey FOREIGN KEY (caja_id) REFERENCES public.cajas(id);


--
-- Name: movimientos_caja movimientos_caja_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_caja
    ADD CONSTRAINT movimientos_caja_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: pagos_cuentas pagos_cuentas_cuenta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos_cuentas
    ADD CONSTRAINT pagos_cuentas_cuenta_id_fkey FOREIGN KEY (cuenta_id) REFERENCES public.cuentas_por_cobrar(id);


--
-- Name: pagos_cuentas pagos_cuentas_negocio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos_cuentas
    ADD CONSTRAINT pagos_cuentas_negocio_id_fkey FOREIGN KEY (negocio_id) REFERENCES public.negocios(id);


--
-- Name: pagos_cuentas_pagar pagos_cuentas_pagar_cuenta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos_cuentas_pagar
    ADD CONSTRAINT pagos_cuentas_pagar_cuenta_id_fkey FOREIGN KEY (cuenta_id) REFERENCES public.cuentas_pagar(id);


--
-- Name: pagos_cuentas_pagar pagos_cuentas_pagar_negocio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos_cuentas_pagar
    ADD CONSTRAINT pagos_cuentas_pagar_negocio_id_fkey FOREIGN KEY (negocio_id) REFERENCES public.negocios(id);


--
-- Name: pedidos_mesa pedidos_mesa_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_mesa
    ADD CONSTRAINT pedidos_mesa_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- Name: pedidos_mesa_detalle pedidos_mesa_detalle_negocio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_mesa_detalle
    ADD CONSTRAINT pedidos_mesa_detalle_negocio_id_fkey FOREIGN KEY (negocio_id) REFERENCES public.negocios(id);


--
-- Name: pedidos_mesa_detalle pedidos_mesa_detalle_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_mesa_detalle
    ADD CONSTRAINT pedidos_mesa_detalle_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos_mesa(id);


--
-- Name: pedidos_mesa_detalle pedidos_mesa_detalle_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_mesa_detalle
    ADD CONSTRAINT pedidos_mesa_detalle_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- Name: pedidos_mesa pedidos_mesa_mesa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_mesa
    ADD CONSTRAINT pedidos_mesa_mesa_id_fkey FOREIGN KEY (mesa_id) REFERENCES public.mesas(id);


--
-- Name: pedidos_mesa pedidos_mesa_negocio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_mesa
    ADD CONSTRAINT pedidos_mesa_negocio_id_fkey FOREIGN KEY (negocio_id) REFERENCES public.negocios(id);


--
-- Name: pedidos_mesa pedidos_mesa_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_mesa
    ADD CONSTRAINT pedidos_mesa_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: productos productos_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- Name: sesiones sesiones_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesiones
    ADD CONSTRAINT sesiones_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: usuarios usuarios_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id);


--
-- Name: ventas ventas_caja_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_caja_id_fkey FOREIGN KEY (caja_id) REFERENCES public.cajas(id);


--
-- Name: ventas ventas_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- Name: ventas_detalle ventas_detalle_negocio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT ventas_detalle_negocio_id_fkey FOREIGN KEY (negocio_id) REFERENCES public.negocios(id);


--
-- Name: ventas_detalle ventas_detalle_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT ventas_detalle_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- Name: ventas_detalle ventas_detalle_venta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT ventas_detalle_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES public.ventas(id);


--
-- Name: ventas ventas_mesa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_mesa_id_fkey FOREIGN KEY (mesa_id) REFERENCES public.mesas(id);


--
-- Name: ventas ventas_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos_mesa(id);


--
-- Name: ventas ventas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: ventas Permitir todo ventas; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Permitir todo ventas" ON public.ventas USING (true);


--
-- Name: ventas_detalle Permitir todo ventas_detalle; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Permitir todo ventas_detalle" ON public.ventas_detalle USING (true);


--
-- Name: ventas; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.ventas ENABLE ROW LEVEL SECURITY;

--
-- Name: ventas_detalle; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.ventas_detalle ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Acceso publico lectura; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Acceso publico lectura" ON storage.objects FOR SELECT USING ((bucket_id = 'productos-imagenes'::text));


--
-- Name: objects Actualizar imagenes; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Actualizar imagenes" ON storage.objects FOR UPDATE USING ((bucket_id = 'productos-imagenes'::text));


--
-- Name: objects Eliminar imagenes; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Eliminar imagenes" ON storage.objects FOR DELETE USING ((bucket_id = 'productos-imagenes'::text));


--
-- Name: objects Subir imagenes; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Subir imagenes" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'productos-imagenes'::text));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crear_venta_completa(p_venta jsonb, p_usuario_id integer, p_negocio_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.crear_venta_completa(p_venta jsonb, p_usuario_id integer, p_negocio_id uuid) TO anon;
GRANT ALL ON FUNCTION public.crear_venta_completa(p_venta jsonb, p_usuario_id integer, p_negocio_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.crear_venta_completa(p_venta jsonb, p_usuario_id integer, p_negocio_id uuid) TO service_role;


--
-- Name: FUNCTION validar_limite_cajas_plan(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.validar_limite_cajas_plan() TO anon;
GRANT ALL ON FUNCTION public.validar_limite_cajas_plan() TO authenticated;
GRANT ALL ON FUNCTION public.validar_limite_cajas_plan() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE webauthn_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_challenges TO postgres;
GRANT ALL ON TABLE auth.webauthn_challenges TO dashboard_user;


--
-- Name: TABLE webauthn_credentials; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_credentials TO postgres;
GRANT ALL ON TABLE auth.webauthn_credentials TO dashboard_user;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE arqueos_caja; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.arqueos_caja TO anon;
GRANT ALL ON TABLE public.arqueos_caja TO authenticated;
GRANT ALL ON TABLE public.arqueos_caja TO service_role;


--
-- Name: SEQUENCE arqueos_caja_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.arqueos_caja_id_seq TO anon;
GRANT ALL ON SEQUENCE public.arqueos_caja_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.arqueos_caja_id_seq TO service_role;


--
-- Name: TABLE cajas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cajas TO anon;
GRANT ALL ON TABLE public.cajas TO authenticated;
GRANT ALL ON TABLE public.cajas TO service_role;


--
-- Name: SEQUENCE cajas_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.cajas_id_seq TO anon;
GRANT ALL ON SEQUENCE public.cajas_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.cajas_id_seq TO service_role;


--
-- Name: TABLE categorias; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.categorias TO anon;
GRANT ALL ON TABLE public.categorias TO authenticated;
GRANT ALL ON TABLE public.categorias TO service_role;


--
-- Name: SEQUENCE categorias_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.categorias_id_seq TO anon;
GRANT ALL ON SEQUENCE public.categorias_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.categorias_id_seq TO service_role;


--
-- Name: TABLE clientes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.clientes TO anon;
GRANT ALL ON TABLE public.clientes TO authenticated;
GRANT ALL ON TABLE public.clientes TO service_role;


--
-- Name: SEQUENCE clientes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.clientes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.clientes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.clientes_id_seq TO service_role;


--
-- Name: TABLE compras; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.compras TO anon;
GRANT ALL ON TABLE public.compras TO authenticated;
GRANT ALL ON TABLE public.compras TO service_role;


--
-- Name: SEQUENCE compras_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.compras_id_seq TO anon;
GRANT ALL ON SEQUENCE public.compras_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.compras_id_seq TO service_role;


--
-- Name: TABLE configuracion_fiscal; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.configuracion_fiscal TO anon;
GRANT ALL ON TABLE public.configuracion_fiscal TO authenticated;
GRANT ALL ON TABLE public.configuracion_fiscal TO service_role;


--
-- Name: TABLE cuentas_pagar; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cuentas_pagar TO anon;
GRANT ALL ON TABLE public.cuentas_pagar TO authenticated;
GRANT ALL ON TABLE public.cuentas_pagar TO service_role;


--
-- Name: SEQUENCE cuentas_pagar_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.cuentas_pagar_id_seq TO anon;
GRANT ALL ON SEQUENCE public.cuentas_pagar_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.cuentas_pagar_id_seq TO service_role;


--
-- Name: TABLE cuentas_por_cobrar; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cuentas_por_cobrar TO anon;
GRANT ALL ON TABLE public.cuentas_por_cobrar TO authenticated;
GRANT ALL ON TABLE public.cuentas_por_cobrar TO service_role;


--
-- Name: SEQUENCE cuentas_por_cobrar_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.cuentas_por_cobrar_id_seq TO anon;
GRANT ALL ON SEQUENCE public.cuentas_por_cobrar_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.cuentas_por_cobrar_id_seq TO service_role;


--
-- Name: TABLE detalles_compra; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.detalles_compra TO anon;
GRANT ALL ON TABLE public.detalles_compra TO authenticated;
GRANT ALL ON TABLE public.detalles_compra TO service_role;


--
-- Name: SEQUENCE detalles_compra_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.detalles_compra_id_seq TO anon;
GRANT ALL ON SEQUENCE public.detalles_compra_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.detalles_compra_id_seq TO service_role;


--
-- Name: TABLE mesas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.mesas TO anon;
GRANT ALL ON TABLE public.mesas TO authenticated;
GRANT ALL ON TABLE public.mesas TO service_role;


--
-- Name: SEQUENCE mesas_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.mesas_id_seq TO anon;
GRANT ALL ON SEQUENCE public.mesas_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.mesas_id_seq TO service_role;


--
-- Name: TABLE movimientos_caja; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.movimientos_caja TO anon;
GRANT ALL ON TABLE public.movimientos_caja TO authenticated;
GRANT ALL ON TABLE public.movimientos_caja TO service_role;


--
-- Name: SEQUENCE movimientos_caja_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.movimientos_caja_id_seq TO anon;
GRANT ALL ON SEQUENCE public.movimientos_caja_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.movimientos_caja_id_seq TO service_role;


--
-- Name: TABLE negocios; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.negocios TO anon;
GRANT ALL ON TABLE public.negocios TO authenticated;
GRANT ALL ON TABLE public.negocios TO service_role;


--
-- Name: TABLE pagos_cuentas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pagos_cuentas TO anon;
GRANT ALL ON TABLE public.pagos_cuentas TO authenticated;
GRANT ALL ON TABLE public.pagos_cuentas TO service_role;


--
-- Name: SEQUENCE pagos_cuentas_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.pagos_cuentas_id_seq TO anon;
GRANT ALL ON SEQUENCE public.pagos_cuentas_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.pagos_cuentas_id_seq TO service_role;


--
-- Name: TABLE pagos_cuentas_pagar; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pagos_cuentas_pagar TO anon;
GRANT ALL ON TABLE public.pagos_cuentas_pagar TO authenticated;
GRANT ALL ON TABLE public.pagos_cuentas_pagar TO service_role;


--
-- Name: SEQUENCE pagos_cuentas_pagar_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.pagos_cuentas_pagar_id_seq TO anon;
GRANT ALL ON SEQUENCE public.pagos_cuentas_pagar_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.pagos_cuentas_pagar_id_seq TO service_role;


--
-- Name: TABLE pedidos_mesa; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pedidos_mesa TO anon;
GRANT ALL ON TABLE public.pedidos_mesa TO authenticated;
GRANT ALL ON TABLE public.pedidos_mesa TO service_role;


--
-- Name: TABLE pedidos_mesa_detalle; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pedidos_mesa_detalle TO anon;
GRANT ALL ON TABLE public.pedidos_mesa_detalle TO authenticated;
GRANT ALL ON TABLE public.pedidos_mesa_detalle TO service_role;


--
-- Name: SEQUENCE pedidos_mesa_detalle_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.pedidos_mesa_detalle_id_seq TO anon;
GRANT ALL ON SEQUENCE public.pedidos_mesa_detalle_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.pedidos_mesa_detalle_id_seq TO service_role;


--
-- Name: SEQUENCE pedidos_mesa_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.pedidos_mesa_id_seq TO anon;
GRANT ALL ON SEQUENCE public.pedidos_mesa_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.pedidos_mesa_id_seq TO service_role;


--
-- Name: TABLE productos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.productos TO anon;
GRANT ALL ON TABLE public.productos TO authenticated;
GRANT ALL ON TABLE public.productos TO service_role;


--
-- Name: SEQUENCE productos_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.productos_id_seq TO anon;
GRANT ALL ON SEQUENCE public.productos_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.productos_id_seq TO service_role;


--
-- Name: TABLE proveedores; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.proveedores TO anon;
GRANT ALL ON TABLE public.proveedores TO authenticated;
GRANT ALL ON TABLE public.proveedores TO service_role;


--
-- Name: SEQUENCE proveedores_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.proveedores_id_seq TO anon;
GRANT ALL ON SEQUENCE public.proveedores_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.proveedores_id_seq TO service_role;


--
-- Name: TABLE roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.roles TO anon;
GRANT ALL ON TABLE public.roles TO authenticated;
GRANT ALL ON TABLE public.roles TO service_role;


--
-- Name: SEQUENCE roles_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.roles_id_seq TO anon;
GRANT ALL ON SEQUENCE public.roles_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.roles_id_seq TO service_role;


--
-- Name: TABLE secuencias_ncf; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.secuencias_ncf TO anon;
GRANT ALL ON TABLE public.secuencias_ncf TO authenticated;
GRANT ALL ON TABLE public.secuencias_ncf TO service_role;


--
-- Name: SEQUENCE secuencias_ncf_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.secuencias_ncf_id_seq TO anon;
GRANT ALL ON SEQUENCE public.secuencias_ncf_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.secuencias_ncf_id_seq TO service_role;


--
-- Name: SEQUENCE sesiones_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.sesiones_id_seq TO anon;
GRANT ALL ON SEQUENCE public.sesiones_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.sesiones_id_seq TO service_role;


--
-- Name: TABLE sesiones; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.sesiones TO anon;
GRANT ALL ON TABLE public.sesiones TO authenticated;
GRANT ALL ON TABLE public.sesiones TO service_role;


--
-- Name: TABLE usuarios; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.usuarios TO anon;
GRANT ALL ON TABLE public.usuarios TO authenticated;
GRANT ALL ON TABLE public.usuarios TO service_role;


--
-- Name: SEQUENCE usuarios_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.usuarios_id_seq TO anon;
GRANT ALL ON SEQUENCE public.usuarios_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.usuarios_id_seq TO service_role;


--
-- Name: TABLE ventas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.ventas TO anon;
GRANT ALL ON TABLE public.ventas TO authenticated;
GRANT ALL ON TABLE public.ventas TO service_role;


--
-- Name: TABLE ventas_detalle; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.ventas_detalle TO anon;
GRANT ALL ON TABLE public.ventas_detalle TO authenticated;
GRANT ALL ON TABLE public.ventas_detalle TO service_role;


--
-- Name: SEQUENCE ventas_detalle_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.ventas_detalle_id_seq TO anon;
GRANT ALL ON SEQUENCE public.ventas_detalle_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.ventas_detalle_id_seq TO service_role;


--
-- Name: SEQUENCE ventas_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.ventas_id_seq TO anon;
GRANT ALL ON SEQUENCE public.ventas_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.ventas_id_seq TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE messages_2026_05_11; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_05_11 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_05_11 TO dashboard_user;


--
-- Name: TABLE messages_2026_05_12; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_05_12 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_05_12 TO dashboard_user;


--
-- Name: TABLE messages_2026_05_13; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_05_13 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_05_13 TO dashboard_user;


--
-- Name: TABLE messages_2026_05_14; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_05_14 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_05_14 TO dashboard_user;


--
-- Name: TABLE messages_2026_05_15; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_05_15 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_05_15 TO dashboard_user;


--
-- Name: TABLE messages_2026_05_16; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_05_16 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_05_16 TO dashboard_user;


--
-- Name: TABLE messages_2026_05_17; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_05_17 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_05_17 TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict 75eCvcyNmdxjRnwb8GnXtkvn52lSICADhAqhSg9r80JM1cqCS8K81g25AP034JP

