## 🚀 Aptos Karma Passport
Reputation-Powered Wallet for Payments, Work Verification & Micro-Loans on Aptos

Aptos Karma Passport is a decentralized reputation and financial identity protocol built on Aptos Devnet.
It enables:

✔ On-chain work proof verification

✔ AI-powered Karma Score Oracle

✔ Passport identity

✔ Micro-loan borrowing/repayment

✔ QR-based payments

✔ Photon API integration for rewarded actions

✔ Full web UI with dashboards for: Employee, Company, Loan Provider, and User.
📁 Project Structure
```

Aptos_Karma_V2/
│
├── backend/
│   ├── api/
│   │   ├── main.py
│   │   │
│   │   ├── routers/
│   │   │   ├── auth_router.py
│   │   │   ├── user_router.py
│   │   │   ├── work_router.py
│   │   │   ├── company_router.py
│   │   │   ├── loan_router.py
│   │   │   ├── provider_router.py
│   │   │   ├── payments_router.py
│   │   │   ├── photon_router.py
│   │   │   └── oracle_router.py
│   │   │
│   │   ├── services/
│   │   │   ├── auth_service.py
│   │   │   ├── user_service.py
│   │   │   ├── workgem_service.py
│   │   │   ├── company_service.py
│   │   │   ├── loan_service.py
│   │   │   ├── provider_service.py
│   │   │   ├── payments_service.py
│   │   │   └── photon_service.py
│   │   │
│   │   └── schemas/
│   │       ├── auth.py
│   │       ├── user.py
│   │       ├── work.py
│   │       ├── company.py
│   │       ├── loan.py
│   │       ├── provider.py
│   │       ├── payments.py
│   │       └── oracle.py
│   │
│   ├── aptos/
│   │   ├── sdk_client.py
│   │   ├── indexer_client.py
│   │   │
│   │   ├── entry_functions/
│   │   │   ├── submit_work.py
│   │   │   ├── approve_work.py
│   │   │   ├── borrow.py
│   │   │   ├── repay.py
│   │   │   ├── deposit.py
│   │   │   └── send_payment.py
│   │
│   ├── photon/
│   │   └── client.py
│   │
│   ├── oracle/
│   │   ├── main.py
│   │   ├── scorer.py
│   │   ├── feature_extractor.py
│   │   ├── signer.py
│   │   └── models/
│   │       └── score_model.json
│   │
│   ├── utils/
│   │   ├── jwt_utils.py
│   │   ├── signature_utils.py
│   │   ├── constants.py
│   │   └── http_client.py
│   │
│   ├── tests/
│   │   ├── test_aptos.py
│   │   ├── test_auth.py
│   │   ├── test_oracle.py
│   │   └── test_services.py
│   │
│   ├── requirements.txt
│   ├── .env
│   └── README.md
│
│
├── contracts/
│   ├── Move.toml
│   │
│   ├── sources/
│   │   ├── passport.move
│   │   ├── oracle_verifier.move
│   │   ├── micro_loan_pool.move
│   │   ├── payments.move
│   │   ├── roles.move
│   │   └── work_gem.move
│   │
│   └── build/     # auto-generated (gitignored)
│
│
├── frontend/
│   ├── node_modules/
│   │
│   ├── public/
│   │
│   ├── src/
│   │   ├── components/
│   │   │   ├── dashboard/
│   │   │   │   ├── CompanyDashboard.jsx
│   │   │   │   ├── EmployeeDashboard.jsx
│   │   │   │   ├── LoanProviderDashboard.jsx
│   │   │   │   └── UserDashboard.jsx
│   │   │   │
│   │   │   ├── roles/
│   │   │   │   └── RoleSwitcher.jsx
│   │   │   │
│   │   │   ├── ui/
│   │   │   │   └── (empty)
│   │   │   │
│   │   │   ├── AnimatedBackground.jsx
│   │   │   ├── LoanApplication.jsx
│   │   │   ├── LoginPage.jsx
│   │   │   ├── NavLink.tsx
│   │   │   ├── WelcomeScreen.jsx
│   │   │   ├── app.js
│   │   │   └── index.html
│   │   │
│   │   ├── data/
│   │   │   ├── deliveries.csv
│   │   │   ├── index.ts
│   │   │   ├── loans.csv
│   │   │   └── users.csv
│   │   │
│   │   ├── hooks/
│   │   │   ├── use-mobile.tsx
│   │   │   ├── use-toast.ts
│   │   │   └── useCSVData.ts
│   │   │
│   │   ├── lib/
│   │   │   └── utils.ts
│   │   │
│   │   ├── pages/
│   │   │   └── Index.jsx
│   │   │
│   │   ├── services/
│   │   │   └── csvService.ts
│   │   │
│   │   ├── App.css
│   │   ├── App.tsx
│   │   ├── index.css
│   │   ├── main.tsx
│   │   └── vite-env.d.ts
│   │
│   ├── .gitignore
│   ├── components.json
│   ├── eslint.config.js
│   ├── index.html
│   ├── package-lock.json
│   ├── package.json
│   ├── postcss.config.js
│   ├── README.md
│   ├── tailwind.config.js
│   ├── tailwind.config.ts
│   ├── tsconfig.app.json
│   ├── tsconfig.json
│   ├── tsconfig.node.json
│   └── vite.config.ts
│
│
├── .gitignore
└── README.md

```


Full detailed folder structure is included at the end of the README.

⚙️ Backend Setup (FastAPI)

1️⃣ Install dependencies
```
cd backend
pip install -r requirements.txt
```

2️⃣ Create a .env file
```
PHOTON_API_KEY=your_key
PHOTON_JWT_SECRET=demo-secret
APTOS_NODE_URL=https://fullnode.devnet.aptoslabs.com/v1
APTOS_INDEXER_URL=https://indexer.devnet.aptoslabs.com/v1/graphql

MODULE_ADDRESS_WORK_GEM=0x7c474757235c6...
MODULE_ADDRESS_PASSPORT=0x7c474757235c6...
MODULE_ADDRESS_LOAN_POOL=0x7c474757235c6...
MODULE_ADDRESS_PAYMENTS=0x7c474757235c6...
```

3️⃣ Start backend

```
uvicorn api.main:app --reload --port 8000

```


4️⃣ Open Swagger UI


➡ http://127.0.0.1:8000/docs

🔮 AI Oracle Setup (Port 7000)

Run Oracle Server
```
cd backend/oracle
python main.py

```

Oracle Endpoints:

Method	Endpoint	Description
POST	/score	Returns AI-powered karma score
POST	/sign	Signs oracle response

Example request:
```

{
  "address": "0xabc",
  "features": {}
}

```

🌐 Frontend Setup (React + Vite)
```
cd frontend
npm install
npm run dev

```


➡ Frontend runs on http://localhost:5173

🔗 Photon API Integration
✔ User Onboarding

POST /photon/onboard
```

Body:

{
  "user_id": "abc123",
  "email": "test@example.com",
  "name": "Soumyadeep"
}

```

Returns access_token for rewarding events.

✔ Reward Event

```
POST /photon/reward

{
  "campaign_id": "ea3bcaca...",
  "user_id": "abc123",
  "metadata": {
    "access_token": "your_token_here"
  }
}

```
✔ Unrewarded Event
```

POST /photon/unreward

{
  "campaign_id": "ea3bcaca...",
  "user_id": "abc123",
  "metadata": {
    "access_token": "your_token_here"
  }
}
```

## 🧾 API Overview (Backend)

| **Module**   | **Endpoint**             | **Method** | **Description** |
|--------------|---------------------------|------------|------------------|
| **Auth**     | `/auth/wallet-login`      | POST       | Sign-in using Aptos wallet signature |
| **User**     | `/user/passport`          | GET / POST | Get or update passport identity |
| **Work**     | `/work/submit`            | POST       | Submit work (hash + XP) for verification |
| **Company**  | `/company/approve`        | POST       | Approve worker XP and validate work |
| **Loan**     | `/loan/borrow`            | POST       | Borrow micro-loan based on reputation |
| **Loan**     | `/loan/repay`             | POST       | Repay active loan |
| **Provider** | `/provider/deposit`       | POST       | Deposit liquidity into the loan pool |
| **Payments** | `/payments/send`          | POST       | Send Aptos payments (QR / P2P) |
| **Photon**   | `/photon/onboard`         | POST       | User onboarding via Photon Custom JWT |
| **Photon**   | `/photon/reward`          | POST       | Trigger a rewarded campaign event |
| **Photon**   | `/photon/unreward`        | POST       | Trigger an unrewarded campaign event |
| **AI Oracle**| `/oracle/score`           | POST       | AI-powered reputation / trust scoring |

## 🧠 Smart Contracts (Move)

Located inside:
```

contracts/sources/

```


Contains:
```

passport.move

work_gem.move

micro_loan_pool.move

payments.move

oracle_verifier.move

roles.move

```


Build contracts
```
cd contracts
aptos move build
```
Publish to Devnet
```
aptos move publish --profile default
```



🖼 UI Screenshots

```
/screenshots/
    dashboard.png
    login.png
    passport.png
    payments.png
    oracle.png

```
### 🛠 Tech Stack
#### Backend

- FastAPI

- Aptos Python SDK

- Photon API

- AI Oracle (custom ML)

#### Frontend

- React

- Vite

- Tailwind

- TypeScript

#### Blockchain

- Aptos Move

- Devnet Deployment

## 🙌 Contributors

Soumyadeep Sarkar – Backend + Integration

Harshini G B - Frontend core developer 

Aparna Sahu- BlockChain Devs

Tapan Sahu- Frontend Dev 


📜 License

MIT
