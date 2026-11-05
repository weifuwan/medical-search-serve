-- Apply once to the Oracle schema used by medical-search-admin.
-- These tables store query expressions and sharing metadata only. Patient data/results are never copied.
CREATE TABLE cbdses_expression_share (
    id VARCHAR2(36) NOT NULL,
    share_code VARCHAR2(64) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    expression VARCHAR2(4000) NOT NULL,
    owner_id NUMBER(19) NOT NULL,
    group_code VARCHAR2(64) NOT NULL,
    organization_code VARCHAR2(64) NOT NULL,
    scope VARCHAR2(16) NOT NULL,
    permission VARCHAR2(8) NOT NULL,
    status VARCHAR2(16) NOT NULL,
    expires_at TIMESTAMP NOT NULL,
    version NUMBER(10) DEFAULT 1 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT pk_cbdses_expression_share PRIMARY KEY (id),
    CONSTRAINT uk_expr_share_code UNIQUE (share_code),
    CONSTRAINT ck_cbdses_expression_scope CHECK (scope IN ('USERS', 'HOSPITAL')),
    CONSTRAINT ck_expr_share_permission CHECK (permission IN ('READ', 'EDIT')),
    CONSTRAINT ck_cbdses_expression_status CHECK (status IN ('ACTIVE', 'REVOKED'))
);

CREATE INDEX idx_cbdses_expression_owner
    ON cbdses_expression_share(owner_id, updated_at);
CREATE INDEX idx_cbdses_expression_scope
    ON cbdses_expression_share(group_code, organization_code, scope, status);

CREATE TABLE cbdses_expression_share_member (
    share_id VARCHAR2(36) NOT NULL,
    user_id NUMBER(19) NOT NULL,
    permission VARCHAR2(8) NOT NULL,
    CONSTRAINT pk_cbdses_expression_member PRIMARY KEY (share_id, user_id),
    CONSTRAINT fk_cbdses_expression_member FOREIGN KEY (share_id)
        REFERENCES cbdses_expression_share(id) ON DELETE CASCADE,
    CONSTRAINT ck_expr_member_permission CHECK (permission IN ('READ', 'EDIT'))
);
CREATE INDEX idx_expr_share_member_user
    ON cbdses_expression_share_member(user_id);

CREATE TABLE cbdses_expression_share_log (
    id VARCHAR2(36) NOT NULL,
    share_id VARCHAR2(36) NOT NULL,
    user_id NUMBER(19) NOT NULL,
    action VARCHAR2(16) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT pk_cbdses_expression_share_log PRIMARY KEY (id),
    CONSTRAINT fk_cbdses_expression_log FOREIGN KEY (share_id)
        REFERENCES cbdses_expression_share(id) ON DELETE CASCADE
);
CREATE INDEX idx_cbdses_expression_log
    ON cbdses_expression_share_log(share_id, created_at);

CREATE TABLE cbdses_expression_favorite (
    id VARCHAR2(36) NOT NULL,
    user_id NUMBER(19) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    expression VARCHAR2(4000) NOT NULL,
    origin_share_id VARCHAR2(36),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT pk_cbdses_expression_favorite PRIMARY KEY (id)
);
CREATE INDEX idx_cbdses_expression_favorite
    ON cbdses_expression_favorite(user_id, created_at);
