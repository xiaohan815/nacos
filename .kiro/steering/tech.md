# Technology Stack

## Backend

### Core Technologies
- **Language**: Java 8+
- **Build Tool**: Maven 3.0.3+
- **Framework**: Spring Boot 2.7.18, Spring Framework 5.3.34, Spring Security 5.7.12
- **Database**: MySQL 8.0.33, Derby 10.14.2.0
- **RPC**: gRPC 1.64.2, Protocol Buffers 3.22.3
- **Consensus**: JRaft 1.3.14 (Raft consensus algorithm)
- **Authentication**: JWT (jjwt 0.11.2)
- **Connection Pooling**: HikariCP 3.4.2
- **Logging**: SLF4J 1.7.26, Logback 1.2.13, Log4j 2.17.1

### Testing
- **Framework**: JUnit 5.10.2, Mockito 4.11.0

## Frontend (console-ui)

### Core Technologies
- **Framework**: React 16.12.0
- **State Management**: Redux 4.0.5, React-Redux 7.1.3
- **Routing**: React Router 5.1.2
- **UI Library**: Alibaba Fusion Design (@alifd/next 1.26.24)
- **Build Tool**: Webpack 4.43.0
- **Transpiler**: Babel 7
- **HTTP Client**: Axios 0.21.1
- **Styling**: Sass/SCSS

### Development Tools
- **Linting**: ESLint 6.8.0 with Alibaba config
- **Code Formatting**: Prettier 1.19.1
- **Git Hooks**: Husky 3.1.0, lint-staged 9.5.0

## Common Build Commands

### Backend (Maven)

```bash
# Install dependencies and build
mvn clean install

# Run tests
mvn test

# Build distribution packages (skip tests)
mvn -Prelease-nacos -Dmaven.test.skip=true clean install -U

# Run configuration integration tests
mvn test -Pcit-test

# Run naming integration tests
mvn test -Pnit-test

# Clean test data
mvn clean -Premove-test-data

# Generate Eclipse project files
mvn -U eclipse:eclipse
```

### Frontend (console-ui)

```bash
# Install dependencies
npm install

# Start development server
npm start

# Build for production
npm run build

# Run ESLint
npm run eslint

# Fix ESLint issues
npm run eslint-fix
```
