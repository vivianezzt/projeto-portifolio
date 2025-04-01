import Technology from '../Technology/Technology';
import { Level } from './Level';
import { Type } from './Type';

export default interface Project {
  id: string;
  name: string;
  type: Type;
  description: string;
  repository: string;
  level: Level;
  images: string[];
  emphasis: boolean;
  technologies: Technology[];
}
