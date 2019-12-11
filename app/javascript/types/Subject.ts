import User from "./User";
import Event from './Event';
import { Tag } from "./Tag";
import StatusIcon from "./StatusIcon";

export default interface Subject {
  id: number;
  title: string;
  credit: string;
  subjected: Subjected;
  created_at: string;
  updated_at: string;
  description: string;
  content: string;
  fields: { [title: string]: string }
  avatar_url: string;
  thumbnail_url: string;
  creator: User;
  path: string;
  api_path: string;
  status: 'draft' | 'published' | 'featured' | 'archived' | 'pinned';
  status_icon: StatusIcon;
  views_count: number;
  unread: boolean;
  editable: boolean;
  events_count: number;
  timelined_events_count: number;
  latest_event: Event;
  tags: Tag[];
  ratings_count: number;
  overall_rating: number;
}

export interface GenericSubjected {
  type: string;
  css_class: string;
  human_name: string;
  plural_human_name: string;
  term: string;
  icon: string;
  supported_widget_names: string[];
}

export type Subjected = 
  | Game;

export interface Game extends GenericSubjected {
  // toodo okedex
}