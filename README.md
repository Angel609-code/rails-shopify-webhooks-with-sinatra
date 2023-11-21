# Shopify Webhooks Integration

🚀 Rails 7.1.2 application for handling Shopify webhooks using Sinatra

## Introduction

This project demonstrates how to set up a Shopify webhook listener in a Rails 7.1.2 application using Sinatra. Webhooks are essential for receiving real-time updates from Shopify, such as when a customer is updated (`customers/update`) or when a product is edited (`products/update`).

## Getting Started

### Prerequisites

- Ruby 3.x
- Rails 7.1.2

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/shopify-webhooks.git
    ```

2. Install dependencies:

    ```bash
    bundle install
    ```

3. Configure Shopify Webhooks:

    Follow the official Shopify guide: [Setting up Webhooks](https://shopify.dev/docs/apps/webhooks/configuration/https)

4. Set up environment variables:

    Create a `.env` file in the project root and add your Shopify API credentials:

    ```env
    SHOPIFY_API_KEY=your-api-key
    SHOPIFY_API_SECRET=your-api-secret
    ```

## Usage

1. Start the application:

    ```bash
    rails s
    ```

2. Access the webhook endpoints:

    - Customer Update: `http://localhost:3000/webhooks/customers/update`
    - Product Update: `http://localhost:3000/webhooks/products/update`

3. Verify incoming webhook data in your Rails console or logs.

## Contributing

Feel free to contribute to this project. Follow the [contribution guidelines](CONTRIBUTING.md) for more details.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

- Thanks to Shopify for providing comprehensive webhook documentation.

## Contact

For any inquiries, please contact [Your Name](mailto:your.email@example.com).

Happy coding! 👩‍💻👨‍💻
