# Flutter Payment Gateway Integration

A comprehensive Flutter application demonstrating integration with multiple payment gateways including Fawaterk, Paymob, and Stripe. This project provides a robust foundation for implementing secure payment processing in your Flutter applications.

## Features

- 🔒 Multiple Payment Gateway Integration
  - Fawaterk Payment Integration
  - Paymob Payment Processing
  - Stripe Payment Services

- 💫 Clean Architecture Implementation
  - Organized project structure
  - Separation of concerns
  - Easy to maintain and scale

- 🎯 Core Features
  - API Consumption with Dio
  - Error Handling
  - Custom Widgets
  - Consistent Styling

## Project Structure

```
lib/
├── core/
│   ├── api/          # API handling and interceptors
│   ├── errors/       # Error handling and models
│   ├── services/     # Payment gateway services
│   ├── utils/        # Utilities and constants
│   └── widgets/      # Reusable widgets
└── feature/
    └── checkout/     # Checkout feature implementation
```

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Payment Gateway API Keys:
  - Fawaterk API credentials
  - Paymob API key
  - Stripe publishable and secret keys

### Installation

1. Clone the repository:
```bash
git clone [repository-url]
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure payment gateway credentials:
   - Create a `.env` file in the project root
   - Add your API keys (refer to `.env.example`)

4. Run the application:
```bash
flutter run
```

## Usage

1. Import the desired payment service:
```dart
import 'package:payments_getway/core/services/fawatrek_payment.dart';
// or
import 'package:payments_getway/core/services/paymob_manger.dart';
// or
import 'package:payments_getway/core/services/stripe_payments.dart';
```

2. Initialize the payment service with your credentials
3. Implement the payment flow using the provided methods
4. Handle the payment response accordingly

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev)
- [Fawaterk](https://fawaterk.com)
- [Paymob](https://paymob.com)
- [Stripe](https://stripe.com)
