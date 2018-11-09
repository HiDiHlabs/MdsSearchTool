---- create tables
-- meta data
CREATE TABLE attribute (
  id SERIAL8 NOT NULL, --use serial8 for ids so sequences are automatically generated
  version INT8 NOT NULL DEFAULT 0,
  description VARCHAR(255) NOT NULL,
  entity_type_id INT8 NOT NULL,
  groupable BOOL NOT NULL,
  nullable BOOL NOT NULL,
  key VARCHAR(255) NOT NULL UNIQUE,
  list_of_values_id INT8,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  unit VARCHAR(255) NULL,
  format VARCHAR(255) NULL,
  version_ VARCHAR(255) NULL,
  PRIMARY KEY (id)
);
CREATE TABLE entity_type (
  id SERIAL8 NOT NULL,
  version INT8 NOT NULL DEFAULT 0,
  key VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL UNIQUE,
  order_ INT4 NOT NULL UNIQUE,
  parent_id INT8,
  PRIMARY KEY (id)
);

-- groups and list of values
CREATE TABLE group_ (
  id SERIAL8 NOT NULL,
  version INT8 NOT NULL,
  entity_type_id INT8,
  name VARCHAR(255) NOT NULL UNIQUE,
  order_ INT4 NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (entity_type_id, order_)
);
CREATE TABLE group_attribute (
  group_id INT8 NOT NULL,
  attribute_id INT8 NOT NULL,
  version INT8 NOT NULL,
  order_ INT4 NOT NULL,
  PRIMARY KEY (group_id, attribute_id)
);
CREATE TABLE list_of_values (
  id SERIAL8 NOT NULL,
  version INT8 NOT NULL,
  name VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (id)
);
CREATE TABLE list_item (
  id SERIAL8 NOT NULL,
  version INT8 NOT NULL,
  key VARCHAR(255) NOT NULL,
  list_of_values_id INT8 NOT NULL,
  value VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  order_ INT4 NOT NULL,
  PRIMARY KEY (id),
  --UNIQUE (list_of_values_id, value),
  UNIQUE (list_of_values_id, key)
);

-- queries
CREATE TABLE query (
  id SERIAL8 NOT NULL,
  version INT8 NOT NULL,
  group_by VARCHAR(255) NOT NULL,
  mode VARCHAR(255) NOT NULL,
  name VARCHAR(255),
  query VARCHAR(255),
  save_date TIMESTAMP,
  type VARCHAR(255) NOT NULL,
  user_id INT8 NOT NULL,
  PRIMARY KEY (id)
);

-- spring security
CREATE TABLE role (
  id SERIAL8 NOT NULL,
  version INT8 NOT NULL,
  authority VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (id)
);
CREATE TABLE user_ (
  id SERIAL8 NOT NULL,
  version INT8 NOT NULL,
  account_expired BOOL NOT NULL,
  account_locked BOOL NOT NULL,
  display_name VARCHAR(255) NOT NULL,
  enabled BOOL NOT NULL,
  mail VARCHAR(255) NOT NULL,
  "password" VARCHAR(255) NOT NULL,
  password_expired BOOL NOT NULL,
  username VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (id)
);
CREATE TABLE user_role (
  role_id INT8 NOT NULL,
  user_id INT8 NOT NULL,
  PRIMARY KEY (role_id, user_id)
);

CREATE TABLE refresh_token (
  id SERIAL8 NOT NULL,
  version INT8 NOT NULL,
  value VARCHAR(255) NOT NULL UNIQUE,
  expiration VARCHAR(255),
  authentication bytea NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE access_token (
  id SERIAL8 NOT NULL,
  version INT8 NOT NULL,
  authentication_key VARCHAR(255) NOT NULL UNIQUE,
  authentication bytea NOT NULL,
  username VARCHAR(255),
  client_id VARCHAR(255) NOT NULL,
  value VARCHAR(255) NOT NULL UNIQUE,
  token_type VARCHAR(255) NOT NULL,
  expiration VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);



Date expiration
Map<String, Object> additionalInformation

static hasOne = [refreshToken: String]
static hasMany = [scope: String]

static constraints = {
username nullable: true
clientId nullable: false, blank: false
value nullable: false, blank: false, unique: true
tokenType nullable: false, blank: false
expiration nullable: false
scope nullable: false
refreshToken nullable: true
authenticationKey nullable: false, blank: false, unique: true
authentication nullable: false, minSize: 1, maxSize: 1024 * 4
additionalInformation nullable: true
}


-- upload timestamp
CREATE TABLE upload_time (
  id SERIAL8 NOT NULL,
  version INT8 NOT NULL,
  site VARCHAR(255) NOT NULL,
  teiler VARCHAR(255) NOT NULL,
  last_upload VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (site,teiler)
);

---- create foreign keys
ALTER TABLE attribute ADD CONSTRAINT FKC7AA9CD0AD4F57 FOREIGN KEY (list_of_values_id) REFERENCES list_of_values;
ALTER TABLE attribute ADD CONSTRAINT FKC7AA9C41ACA130 FOREIGN KEY (entity_type_id) REFERENCES entity_type;
ALTER TABLE entity_type ADD CONSTRAINT entity_type_parent_fk FOREIGN KEY (parent_id) REFERENCES entity_type;
ALTER TABLE group_ ADD CONSTRAINT FKB63DD9C041ACA130 FOREIGN KEY (entity_type_id) REFERENCES entity_type;
ALTER TABLE group_attribute ADD CONSTRAINT FK7722C8DC197762CB FOREIGN KEY (attribute_id) REFERENCES attribute;
ALTER TABLE group_attribute ADD CONSTRAINT FK7722C8DCCEDAA46B FOREIGN KEY (group_id) REFERENCES group_;
ALTER TABLE list_item ADD CONSTRAINT FKE15B8B69D0AD4F57 FOREIGN KEY (list_of_values_id) REFERENCES list_of_values;
ALTER TABLE query ADD CONSTRAINT FK66F18C82E866583 FOREIGN KEY (user_id) REFERENCES user_;
ALTER TABLE user_role ADD CONSTRAINT FK143BF46A895BA1A3 FOREIGN KEY (role_id) REFERENCES role;
ALTER TABLE user_role ADD CONSTRAINT FK143BF46A2E866583 FOREIGN KEY (user_id) REFERENCES user_;
