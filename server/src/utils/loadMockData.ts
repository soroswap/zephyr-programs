import path from 'path';
import fs from 'fs';

export const mockData = (protocol: string, entity: 'tokens' | 'pairs' | 'events'): any[] => {
  const mockFilePath = path.join(__dirname, '..', 'mock', protocol, `${entity}.json`);

  if (!fs.existsSync(mockFilePath)) {
    throw new Error(`Mock data file not found for protocol ${protocol} and entity ${entity}`);
  }

  const data = JSON.parse(fs.readFileSync(mockFilePath, 'utf-8'));
  return data;
};