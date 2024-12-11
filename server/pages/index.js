import SwaggerUI from 'swagger-ui-react';
import 'swagger-ui-react/swagger-ui.css';
import { useState, useEffect } from 'react';

export default function DocsPage() {
  const [swaggerSpec, setSwaggerSpec] = useState(null);

  useEffect(() => {
    fetch('/api/swagger')
      .then((response) => {
        if (!response.ok) {
          throw new Error('Failed to fetch Swagger spec');
        }
        return response.json();
      })
      .then((spec) => setSwaggerSpec(spec))
      .catch((error) => console.error('Error fetching Swagger spec:', error));
  }, []);

  if (!swaggerSpec) {
    return <div>Loading...</div>; // Show a loading state while fetching
  }

  return <SwaggerUI spec={swaggerSpec} />;
}
