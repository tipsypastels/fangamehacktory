export default interface Subject {
  id: number;
  title: string;
  description: string;
  color: string;
  avatarURL: string;
  thumbnailURL: string;
  creatorUsername: string;
  creatorPath: string;
  path: string;
  cssClass: string;
  status: 'draft' | 'published' | 'archived';
}