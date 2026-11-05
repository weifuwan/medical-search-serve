-- Apply to the Oracle schema used by the application's master data source.
-- Share records contain only query text and metadata, never patient results.
CREATE TABLE cbdses_expression_share (
    id VARCHAR2(36) NOT NULL PRIMARY KEY,
    share_code VARCHAR2(64) NOT NULL UNIQUE,
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
    CONSTRAINT ck_expression_scope CHECK (scope IN ('USERS', 'HOSPITAL')),
    CONSTRAINT ck_expression_permission CHECK (permission IN ('READ', 'EDIT')),
    CONSTRAINT ck_expression_status CHECK (status IN ('ACTIVE', 'REVOKED'))
);
CREATE INDEX idx_expression_owner ON cbdses_expression_share(owner_id, updated_at);
CREATE INDEX idx_expression_scope ON cbdses_expression_share(group_code, organization_code, scope, status);

CREATE TABLE cbdses_expression_share_member (
    share_id VARCHAR2(36) NOT NULL,
    user_id NUMBER(19) NOT NULL,
    permission VARCHAR2(8) NOT NULL,
    CONSTRAINT pk_expression_member PRIMARY KEY (share_id, user_id),
    CONSTRAINT fk_expression_member FOREIGN KEY (share_id)
        REFERENCES cbdses_expression_share(id) ON DELETE CASCADE
);
CREATE INDEX idx_expression_member_user ON cbdses_expression_share_member(user_id);

CREATE TABLE cbdses_expression_share_log (
    id VARCHAR2(36) NOT NULL PRIMARY KEY,
    share_id VARCHAR2(36) NOT NULL,
    user_id NUMBER(19) NOT NULL,
    action VARCHAR2(16) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT fk_expression_log FOREIGN KEY (share_id)
        REFERENCES cbdses_expression_share(id) ON DELETE CASCADE
);
CREATE INDEX idx_expression_log_share ON cbdses_expression_share_log(share_id, created_at);

CREATE TABLE cbdses_expression_favorite (
    id VARCHAR2(36) NOT NULL PRIMARY KEY,
    user_id NUMBER(19) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    expression VARCHAR2(4000) NOT NULL,
    origin_share_id VARCHAR2(36),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE INDEX idx_expression_favorite_user ON cbdses_expression_favorite(user_id, created_at);
