using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Razer
{
    public class PlaylistHandler
    {
        public PlaylistHandler()
        {
            Songs = new List<Song>();
            Shuffle = false;
            PlayingIndex = 0;
        }
        public List<Song> Songs { get; set; }
        public int PlayingIndex { get; set; }
        public bool Shuffle { get; set; }
        public void SetSongPlayed(int SongID)
        {
            if (Songs.Count > 0)
            {
                for (int i = 0; i < Songs.Count; i++)
                {
                    if (Songs[i].ID == SongID)
                    {
                        PlayingIndex = i;
                        Songs[i].Played = true;
                        return;
                    }
                }
            }
        }
        public int GetNextSongID()
        {
            if (Songs.Count > 0)
            {
                if (Shuffle)
                {
                    int nextSongIndex = new Random().Next(Songs.Count);
                    while (Songs[nextSongIndex].Played)
                    {
                        bool songAvaiable = false;

                        for (int i = 0; i < Songs.Count; i++)
                        {
                            if (!Songs[i].Played)
                            {
                                songAvaiable = true;
                                break;
                            }
                        }

                        if (!songAvaiable)
                        {
                            nextSongIndex = 0;
                            ResetPlayed();
                            break;
                        }
                        else
                        {
                            nextSongIndex = new Random().Next(Songs.Count);
                        }
                    }
                    PlayingIndex = nextSongIndex;
                }
                else
                {
                    for (int i = PlayingIndex; i < Songs.Count; i++)
                    {
                        if (!Songs[i].Played)
                        {
                            Songs[i].Played = true;
                            PlayingIndex = i;
                            break;
                        }
                        PlayingIndex = 0;
                        ResetPlayed();
                    }
                }
                Songs[PlayingIndex].Played = true;
                return Songs[PlayingIndex].ID;
            }
            else
            {
                return -1;
            }
        }
        public int GetPrevSongID()
        {
            PlayingIndex = PlayingIndex > 0 ? PlayingIndex - 1 : 0;
            Songs[PlayingIndex].Played = true;
            return Songs[PlayingIndex].ID;
        }
        private void ResetPlayed()
        {
            foreach (Song song in Songs)
            {
                song.Played = false;
            }
        }
    }
}