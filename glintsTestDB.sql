PGDMP         1                v         
   glintsTest    10.5    10.4 0    x           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            {           1262    16386 
   glintsTest    DATABASE     ~   CREATE DATABASE "glintsTest" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE "glintsTest";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            |           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    13253    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            }           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16418 
   collection    TABLE     �   CREATE TABLE public.collection (
    collection_id integer NOT NULL,
    collection_name character varying(255),
    create_time timestamp(6) without time zone
);
    DROP TABLE public.collection;
       public         postgres    false    3            �            1259    16416    collection_collection_id_seq    SEQUENCE     �   ALTER TABLE public.collection ALTER COLUMN collection_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.collection_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    203    3            �            1259    16425    collection_detail    TABLE     �   CREATE TABLE public.collection_detail (
    collection_detail_id integer NOT NULL,
    collection_id integer,
    user_id integer,
    status character varying(255)
);
 %   DROP TABLE public.collection_detail;
       public         postgres    false    3            �            1259    16423 *   collection_detail_collection_detail_id_seq    SEQUENCE       ALTER TABLE public.collection_detail ALTER COLUMN collection_detail_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.collection_detail_collection_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    3    205            �            1259    24585    collection_list    TABLE     �   CREATE TABLE public.collection_list (
    collectionlist_id integer NOT NULL,
    collection_id integer,
    resto_id integer
);
 #   DROP TABLE public.collection_list;
       public         postgres    false    3            �            1259    24583 %   collection_list_collectionlist_id_seq    SEQUENCE     �   ALTER TABLE public.collection_list ALTER COLUMN collectionlist_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.collection_list_collectionlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    3    209            �            1259    16404    resto    TABLE     d   CREATE TABLE public.resto (
    resto_id integer NOT NULL,
    resto_name character varying(255)
);
    DROP TABLE public.resto;
       public         postgres    false    3            �            1259    16411    resto_detail    TABLE     �   CREATE TABLE public.resto_detail (
    resto_detail_id integer NOT NULL,
    resto_id integer,
    day character varying(255),
    time_open time(0) without time zone,
    time_close time(0) without time zone
);
     DROP TABLE public.resto_detail;
       public         postgres    false    3            �            1259    16409     resto_detail_resto_detail_id_seq    SEQUENCE     �   ALTER TABLE public.resto_detail ALTER COLUMN resto_detail_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.resto_detail_resto_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    3    201            �            1259    16402    resto_resto_id_seq    SEQUENCE     �   ALTER TABLE public.resto ALTER COLUMN resto_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.resto_resto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    3    199            �            1259    16390    resto_schedule    TABLE     �   CREATE TABLE public.resto_schedule (
    resto_name character varying(255) NOT NULL,
    date_time character varying(255) NOT NULL,
    resto_id smallint NOT NULL
);
 "   DROP TABLE public.resto_schedule;
       public         postgres    false    3            �            1259    16400    resto_schedule_resto_id_seq    SEQUENCE     �   ALTER TABLE public.resto_schedule ALTER COLUMN resto_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.resto_schedule_resto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    196    3            �            1259    16437    user    TABLE     �   CREATE TABLE public."user" (
    user_id integer NOT NULL,
    user_name character varying(255),
    user_password character varying(255),
    user_email character varying(255)
);
    DROP TABLE public."user";
       public         postgres    false    3            �            1259    16435    user_user_id_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    3    207            o          0    16418 
   collection 
   TABLE DATA               Q   COPY public.collection (collection_id, collection_name, create_time) FROM stdin;
    public       postgres    false    203   F6       q          0    16425    collection_detail 
   TABLE DATA               a   COPY public.collection_detail (collection_detail_id, collection_id, user_id, status) FROM stdin;
    public       postgres    false    205   �6       u          0    24585    collection_list 
   TABLE DATA               U   COPY public.collection_list (collectionlist_id, collection_id, resto_id) FROM stdin;
    public       postgres    false    209   �6       k          0    16404    resto 
   TABLE DATA               5   COPY public.resto (resto_id, resto_name) FROM stdin;
    public       postgres    false    199   '7       m          0    16411    resto_detail 
   TABLE DATA               ]   COPY public.resto_detail (resto_detail_id, resto_id, day, time_open, time_close) FROM stdin;
    public       postgres    false    201   �9       h          0    16390    resto_schedule 
   TABLE DATA               I   COPY public.resto_schedule (resto_name, date_time, resto_id) FROM stdin;
    public       postgres    false    196   ^;       s          0    16437    user 
   TABLE DATA               O   COPY public."user" (user_id, user_name, user_password, user_email) FROM stdin;
    public       postgres    false    207   C?       ~           0    0    collection_collection_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.collection_collection_id_seq', 20, true);
            public       postgres    false    202                       0    0 *   collection_detail_collection_detail_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.collection_detail_collection_detail_id_seq', 14, true);
            public       postgres    false    204            �           0    0 %   collection_list_collectionlist_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.collection_list_collectionlist_id_seq', 4, true);
            public       postgres    false    208            �           0    0     resto_detail_resto_detail_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.resto_detail_resto_detail_id_seq', 71, true);
            public       postgres    false    200            �           0    0    resto_resto_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.resto_resto_id_seq', 50, true);
            public       postgres    false    198            �           0    0    resto_schedule_resto_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.resto_schedule_resto_id_seq', 50, true);
            public       postgres    false    197            �           0    0    user_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_user_id_seq', 3, true);
            public       postgres    false    206            �           2606    16429 (   collection_detail collection_detail_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.collection_detail
    ADD CONSTRAINT collection_detail_pkey PRIMARY KEY (collection_detail_id);
 R   ALTER TABLE ONLY public.collection_detail DROP CONSTRAINT collection_detail_pkey;
       public         postgres    false    205            �           2606    24589 $   collection_list collection_list_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.collection_list
    ADD CONSTRAINT collection_list_pkey PRIMARY KEY (collectionlist_id);
 N   ALTER TABLE ONLY public.collection_list DROP CONSTRAINT collection_list_pkey;
       public         postgres    false    209            �           2606    16422    collection collection_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (collection_id);
 D   ALTER TABLE ONLY public.collection DROP CONSTRAINT collection_pkey;
       public         postgres    false    203            �           2606    16415    resto_detail resto_detail_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.resto_detail
    ADD CONSTRAINT resto_detail_pkey PRIMARY KEY (resto_detail_id);
 H   ALTER TABLE ONLY public.resto_detail DROP CONSTRAINT resto_detail_pkey;
       public         postgres    false    201            �           2606    16408    resto resto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.resto
    ADD CONSTRAINT resto_pkey PRIMARY KEY (resto_id);
 :   ALTER TABLE ONLY public.resto DROP CONSTRAINT resto_pkey;
       public         postgres    false    199            �           2606    16399 "   resto_schedule resto_schedule_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.resto_schedule
    ADD CONSTRAINT resto_schedule_pkey PRIMARY KEY (resto_id);
 L   ALTER TABLE ONLY public.resto_schedule DROP CONSTRAINT resto_schedule_pkey;
       public         postgres    false    196            �           2606    16444    user user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    207            �           2606    16430    collection_detail collection_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.collection_detail
    ADD CONSTRAINT collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(collection_id);
 I   ALTER TABLE ONLY public.collection_detail DROP CONSTRAINT collection_id;
       public       postgres    false    203    205    3043            �           2606    24595    collection_list collection_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.collection_list
    ADD CONSTRAINT collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(collection_id);
 G   ALTER TABLE ONLY public.collection_list DROP CONSTRAINT collection_id;
       public       postgres    false    203    209    3043            �           2606    24590    collection_list resto_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.collection_list
    ADD CONSTRAINT resto_id FOREIGN KEY (resto_id) REFERENCES public.resto(resto_id);
 B   ALTER TABLE ONLY public.collection_list DROP CONSTRAINT resto_id;
       public       postgres    false    199    209    3039            �           2606    32770    resto_detail resto_id    FK CONSTRAINT     {   ALTER TABLE ONLY public.resto_detail
    ADD CONSTRAINT resto_id FOREIGN KEY (resto_id) REFERENCES public.resto(resto_id);
 ?   ALTER TABLE ONLY public.resto_detail DROP CONSTRAINT resto_id;
       public       postgres    false    3039    199    201            �           2606    16445    collection_detail user_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.collection_detail
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(user_id);
 C   ALTER TABLE ONLY public.collection_detail DROP CONSTRAINT user_id;
       public       postgres    false    207    3047    205            o   V   x�3���MM,Q��/K-*�420��5��52T0��20�2��2��tM�,IMA�5�2�".#N����~�KC+ 21����� js      q   4   x�34�4��4�LL����24�4�D��ArƜ���I�E\�&�Fp�=... ���      u   '   x�3�4��4�2�4��4�2�,�L8�8�b���� P��      k   a  x�mS�n�0</�����z�u��&Nb�nd(��Zޘ�)2 ���w)���d�ٝݙ��[�#�P>S�0z���a�H֝�Gm������V7Gy!���]Q�Z�DK��qO�Q��$o��?�	<ѻ�!����{���6�{��@�Ro�ѡs���v��9(Aſ�ʚ�Ź=�ѭ�c;�e�6	ܠo��µ;<�GSV@�-�����Z�cJ��������c�5�l�0��&�lu�c��Ȧ�D=�`I~�ߜg�6d��~�~OV�#xp��� ��GV��F�,۝s�
XD �/�&����\���RVѳ/9�R�R�f۴�a
[OA�3�n���c��9��o����=`#�E/�b�d�/��6��2���"��r�O��F�e`�)l=���뫬�j�x� oc��S.�lN�����lV����d�\Q��T�Q���w�&����V�$]˾r9�^ ���ZfPQ@��#ȡr�3�-�C�R�+_pr�e�ю�AV�B�u��.K������v/W.���	%4���	�����@ǔ+��:�~�g��4��㵭i�;��DI����9<���>��`��9R�䚋7��.~}B���^g      m   �  x�}�Mn�0��s���$=K7HP��R	��޾�@2��%��;�%�\p_����ׅ����.��5D�m9]ۚ�?����̻?���~�|�x�0��p[.m��[O.ꤸ��I�|n6ɂ��u�x����i�6��3{�%�&��P����-�x�l��e�C;e1�[e1��+�&讬��WV/ ޿+����e���}Y��b}�ّ.�~�䡺L8�[e� �~]&��u�Q�P]�tb_˼�vq�>�i�ڧ1M��iL3�Oc�puE�q�#�usrck&>~������2��Sq]Pxk,�>���	�+���d|\����{Fj�3���=����{FnN"hg�Pa��DG7��MP�9��{Ί���sV\M�mL��^OQ��zI�ꏒ��M{a�����
R�L�`��<3?�dRȟ��/��p@�.�⷗a� ���      h   �  x��Vɒ�H=�_Q'��̠�E�zz����3ሹ$�U U%Ɏ��O��@K	�������{/�����O3�5�l�Rr���l�K�8�ÄY��	c��;-�k����d��&�l�	yr�>����sF������*\(����ް�y�3u��B@V�%����)P-��7�,"�S⁳;3�_��ϝN��[&�w&~��1<��Ǒ`�r'Pvjj5P5W���>W;�G���7��hL&����g�f*�Z�=P��`���X�b^W�6����J�5��v4�[�P�I�,��ܶf��a�3#GTH\DNU�S��XA���U��׾��Y�sa�	aq�U��ܩ� �)�bD�Ӵ���}�#J"'�kLS�EGh���C��p)�-�8���h�a��0�����Uu׵@�M�ի�J(��}JUTO�
�	<�̵�ʥ߁3�����-X�T�(3x����Q�슾jk�g�7����dE���-�Nj
wG�WN|�c��X.Q��Rv#����`0s]��z�5��?ʥS�qn����J�MO�=ӃOH]�<ݰE�K�����DD���� ��c|��t�	l4����N�1U�b��46ş���o��C�}�Z^	] w���fl�/�n&f���5�1��7��]AAjSD�A*����	�F�S��3�Dc�s{�:��V�o��BS�FL��4��(�T�r�K���v߰n�ϊ�W��Y���,�`K�P<�v,�v�9nĘ��e�Ub/F�/�m1�{�'0#��]u�E.��`�S��/CU}��B��!��J3Ü����N݌z��-��q�4�%���m��e�D�m1�=X�8'}��P��R�rϿ?�FYt�+&��1���A��o��`v}���i؄?!�G���3^��5W�+�Ҵ ]>iH$�߉�k
ċa�EM�g��3��Jװ�c5Yc��,FXU��V�`�Tہ�[ah�$]�i�o<��� �L|�      s   �   x�U̽R�0  �<3i�M�&b�j��Ur.�/II�i�ޥ�u��>8�3�eJ�F���6���1��ء�>�D�����˪��!/���F�$@�0&x���q����fR9�I[�L{���@]|��G�J��1N���h�ӧ��Cz^�/�%��υ�v׃3-[~�{W��7� �:�8��v��TK�xS�s���
D�Z���ן$@��M��X���W]�     