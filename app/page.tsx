import '@radix-ui/themes/styles.css';
import Link from 'next/link';

export default function Home() {
  return (
    <div>
      <h1>Home</h1>
      <Link href="/newgame">New Game</Link>
    </div>
  );
}
